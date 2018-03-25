package cn.com.retrans.controller;

import cn.com.retrans.pojo.Report;
import cn.com.retrans.service.ReportService;
import cn.com.retrans.utils.BasicDao;
import cn.com.retrans.utils.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import java.io.IOException;
import java.net.InetSocketAddress;
import java.nio.ByteBuffer;
import java.nio.channels.SelectionKey;
import java.nio.channels.Selector;
import java.nio.channels.ServerSocketChannel;
import java.nio.channels.SocketChannel;
import java.nio.charset.Charset;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @author Administrator
 * 数据如何来，如何处理
 */
@Controller
public class DataProcessController {
    @Autowired
    private ReportService reportService;

    //有三个信号的设备
    public static final String[] NORMAL_DEVICE = {"filter_pumb_1","filter_pumb_2","pac_blender", "pam_blender","pac_metering_pumb_1","pac_metering_pumb_2",
            "pam_metering_pumb_1","pam_metering_pumb_2","raw_water_pumb_1","raw_water_pumb_2","water_supply_pumb_1","water_supply_pumb_2","back_flush_pumb",
            "blower","anti_virus_device"};
    //有四个信号的设备
    public static final String[] ELECTRIC_DEVICE = {"electric_valve"};
    //有一个信号的设备
    public static final String[] OTHER_DEVICE = {"medical_kit_index","regulate_low","regulate_high","middle_low","middle_middle",
            "middle_high","water_low","water_middle","water_high","black_flush_1","black_flush_2","black_flush_3","black_flush_4"};
    /**
     * @param args
     */
    public static void main(String[] args) {
//        String headers = "(collect_date,collect_time,filter_pumb_1,filter_pumb_2,pac_blender, pam_blender,pac_metering_pumb_1,pac_metering_pumb_2," +
//                "pam_metering_pumb_1,pam_metering_pumb_2,raw_water_pumb_1,raw_water_pumb_2,water_supply_pumb_1,water_supply_pumb_2,back_flush_pumb," +
//                "blower,anti_virus_device,electric_valve,medical_kit_index,regulate_low,regulate_high,middle_low,middle_middle," +
//                "middle_high,water_low,water_middle,water_high,black_flush_1,black_flush_2,black_flush_3,black_flush_4,system_run,mud_level,env_dimidity," +
//                "env_temperature,cable_temperature,smoke_signal,water_signal)";
//        String value = "'2018-03-25','21:49:15',1,0,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,0,1,0,0,1,0,1,1,1,1,2.0,20.0,15.0,26.0,1,1";
//        System.out.println(value.split(",").length);
        try {
            startServer(Constants.SERVER_IP, Constants.SERVER_PORT);
        } catch (IOException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    public static void startServer(String serverIp, int serverPort) throws IOException, InterruptedException {
        /*
         *开启一个服务channel，
         *A selectable channel for stream-oriented listening sockets.
         */
        ServerSocketChannel serverChannel = ServerSocketChannel.open();
        serverChannel.configureBlocking(false);
        serverChannel.bind(new InetSocketAddress(serverIp, serverPort));

        /*
         * 创建一个selector
         */
        Selector selector = Selector.open();
        /*
         * 将创建的serverChannel注册到selector选择器上，指定这个channel只关心OP_ACCEPT事件
         */
        serverChannel.register(selector, SelectionKey.OP_ACCEPT);
        int index = 0;
        List<String> receiveList = new ArrayList<>(3);
        while (true) {
            /*
             * select()操作，默认是阻塞模式的，即，当没有accept或者read时间到来时，将一直阻塞不往下面继续执行。
             */
            int readyChannels = selector.select();
            if (readyChannels <= 0) {
                continue;
            }

            /*
             * 从selector上获取到了IO事件，可能是accept，也有可能是read
             */
            Set<SelectionKey> SelectonKeySet = selector.selectedKeys();
            Iterator<SelectionKey> iterator = SelectonKeySet.iterator();

            /*
             * 循环遍历SelectionKeySet中的所有的SelectionKey
             */

            while (iterator.hasNext()) {
                SelectionKey key = iterator.next();
                if (key.isAcceptable()) {          //处理OP_ACCEPT事件
                    SocketChannel socketChannel = serverChannel.accept();
                    socketChannel.configureBlocking(false);
                    socketChannel.register(selector, SelectionKey.OP_READ);
                } else if (key.isReadable()) {  //处理OP_READ事件
                    SocketChannel socketChannel = (SocketChannel) key.channel();
                    StringBuilder sb = new StringBuilder();
                    ByteBuffer byteBuffer = ByteBuffer.allocate(1024);

                    int readBytes = 0;
                    int ret = 0;
                    /*
                     * 注意读数据的时候，ByteBuffer的操作，需要flip,clear进行指针位置的调整
                     */
                    while ((ret = socketChannel.read(byteBuffer)) > 0) {
                        readBytes += ret;
//                        System.out.println("read:" + readBytes);
                        byteBuffer.flip();
//                        System.out.println("limit:" + byteBuffer.limit());
//                        System.out.println("remain:" + byteBuffer.remaining());
//                        System.out.println("capacity:" + byteBuffer.capacity());
//                        byte[] bytes = new byte[byteBuffer.remaining()];
//                        byteBuffer.get(bytes, 0, bytes.length);
                        //byte[]转换为hexstring
//                        sb.append(bytesToHexString(bytes));
                        sb.append(Charset.forName("UTF-8").decode(byteBuffer).toString());
                        byteBuffer.clear();
                    }

                    if (readBytes == 0) {
                        System.err.println("handle opposite close Exception");
                        socketChannel.close();
                    }

                    String message = sb.toString();
                    System.out.println("Message from client1: " + message);
                    receiveList.add(message);
                    index++;
                    if(index == 3){
                        processMessage(receiveList);
                        index = 0;
                        receiveList.clear();
                    }
//                    processMessage(message);
                    if (Constants.CLIENT_CLOSE.equalsIgnoreCase(message.toString().trim())) {
                        System.out.println("Client is going to shutdown!");
                        socketChannel.close();
                    } else if (Constants.SERVER_CLOSE.equalsIgnoreCase(message.trim())) {
                        System.out.println("Server is going to shutdown!");
                        socketChannel.close();
                        serverChannel.close();
                        selector.close();
                        System.exit(0);
                    } else {
                        String outMessage = "Server response：" + message;
                        socketChannel.write(Charset.forName("UTF-8").encode(outMessage));
                    }
                }
                /*
                 * 将selector上当前已经监听到的且已经处理了的事件标记清除掉。
                 */
                iterator.remove();
            }
        }
    }

    /**
     * EE EE 00 01 00 01 00 01 04 0C d[0] d[1] d[2] d[3] d[4] d[5] d[6] d[7] d[8] d[9] d[10] d[11] xx（前面所有字节累加和）  DD
     * 数据1:eeee000100010001040C     75   DB   B6   6D   DB   B6   2A   7D   00   11    22    33  xx dd
     * EE EE 00 03 00 01 00 02 02 01 a[0]                              xx（前面所有字节累加和）  DD
     * 数据3：eeee0003022e16070410    00ad0108000500050005000500050005 14dd

     *
     * @param messageList
     */
    private static void processMessage(List<String> messageList) {
        BasicDao basicDao = new BasicDao("retrans");
        basicDao.open();
        String headers = "(collect_date,collect_time,filter_pumb_1,filter_pumb_2,pac_blender, pam_blender,pac_metering_pumb_1,pac_metering_pumb_2," +
                "pam_metering_pumb_1,pam_metering_pumb_2,raw_water_pumb_1,raw_water_pumb_2,water_supply_pumb_1,water_supply_pumb_2,back_flush_pumb," +
                "blower,anti_virus_device,electric_valve,medical_kit_index,regulate_low,regulate_high,middle_low,middle_middle," +
                "middle_high,water_low,water_middle,water_high,black_flush_1,black_flush_2,black_flush_3,black_flush_4,system_run,mud_level,env_dimidity," +
                "env_temperature,cable_temperature,smoke_signal,water_signal)";
        StringBuilder values = new StringBuilder();
        Date day=new Date();
        SimpleDateFormat df1 = new SimpleDateFormat("yyyy-MM-dd");
        SimpleDateFormat df2 = new SimpleDateFormat("HH:mm:ss");
        values.append("(\'").append(df1.format(day)).append("\','").append(df2.format(day)).append("\',");
        for(String message:messageList){
            if (message.length() == 48 && message.charAt(7) == '1') {
                //命令1
                String value1 = processMessage1(message);
                values.append(value1);
            }else if(message.length() == 36 && message.charAt(7) == '2'){
                //命令2
                String value2 = processMessage2(message);
                values.append(value2);
            }else if(message.length() == 26 && message.charAt(7) == '3'){
                //命令3
                String value3 = processMessage3(message);
                values.append(value3);
            }
        }
        values.append(")");
        String sql = "insert into report "+headers+" values "+values.toString();
        System.out.println("sql:"+sql);
        basicDao.put(sql);
        basicDao.close();
    }

    /**
     * EE EE 00 03 00 01 00 02 02 01 a[0]  xx（前面所有字节累加和）  DD
     * eeee0003000100020201          11    F6DD
     * @param message
     */
    private static String processMessage3(String message) {
        StringBuilder value = new StringBuilder();
        String a0Hex = message.substring(20,22);
        String a0Binary = hexString2binaryString(a0Hex);
        if(a0Binary.charAt(7) == '1'){
            value.append("1,");
            System.out.println("有烟信号");
        }else{
            value.append("0,");
            System.out.println("没有烟信号");
        }
        //最后一个
        if(a0Binary.charAt(3) == '1'){
            value.append("1");
            System.out.println("有水信号");
        }else{
            value.append("0");
            System.out.println("没有水信号");
        }
        return value.toString();
    }

    /**
     *EE EE 00 02 00 01 00 02 04 06 d[0] d[1] d[2] d[3] d[4] d[5] xx（前面所有字节累加和）  DD
     * 数据2：eeee0002000100020406   00   c8   00   96   01   04  32dd
     * @param message
     */
    private static String processMessage2(String message) {
        StringBuilder value = new StringBuilder();
        //d0和d1计算环境湿度，公式是(d0*256+d1)/10
        float envHumidity = commonCompute(message.substring(20,22),message.substring(22,24));
        value.append(envHumidity).append(",");
        System.out.println("环境湿度是:"+envHumidity+"%RH");
        //d2和d3计算环境温度，公式是(d2*256+d3)/10
        float envTemperature = commonCompute(message.substring(24,26),message.substring(26,28));
        value.append(envTemperature).append(",");
        System.out.println("环境温度是:"+envTemperature+"度");
        //d4和d5计算电缆温度，公式是(d4*256+d5)/10
        float cableTemperature = commonCompute(message.substring(28,30),message.substring(30,32));
        value.append(cableTemperature).append(",");
        System.out.println("电缆温度是:"+cableTemperature+"度");
        return value.toString();
    }

    /**
     * 通用的计算公式
     * @param d0
     * @param d1
     * @return
     */
    private static float commonCompute(String d0, String d1) {
        //d0,d1都是十六进制，需要转为十进制
        return (float)(Integer.parseInt(d0,16)*256+Integer.parseInt(d1,16))/10;
    }

    /**
     * EE EE 00 01 00 01 00 01 04 0C d[0] d[1] d[2] d[3] d[4] d[5] d[6] d[7] d[8] d[9] d[10] d[11] xx（前面所有字节累加和）  DD
     * 数据1:eeee000100010001040C     75   DB   B6   6D   DB   B6   2A   7D   00   11    22    33  xx dd
     * EEEE000100010001040C75DBB66DDBB62A7D40000000DADD
     *
     * @param message
     */
    private static String processMessage1(String message) {
        StringBuilder value = new StringBuilder();
        //将d0-d7的数据转成二进制数据连成一个字符串
        int startIndex = 20;
        int endIndex = 36;
        String allHexString = message.substring(startIndex,endIndex);
        String allBinaryString = getBinaryString(allHexString);
        System.out.println(allBinaryString);
        //101 011 101 101 101 101 101 101 101 101 101 101 101 101 101 1010 1 0 1 0 1 0 0 1 0 1 1 1 1 1 0
        //第一组有三个信号的
        for(int i=0,j=0;i<NORMAL_DEVICE.length*3;i=i+3,j++){
            String deviceName = NORMAL_DEVICE[j];
            String single = allBinaryString.substring(i,i+3);
            //信号的顺序是：0位运行、1位故障、2位启动
            //数据库里存储时，0表示故障，1表示运行，2表示启动,-2表示未启动
            //优先判断是否已启动
            if(single.charAt(2) == '0'){
                value.append("-2,");
            }
            //然后判断启动着的机器是正常运行还是故障
            if(single.charAt(0) == '1'){
                value.append("1,");
            }
            if(single.charAt(1) == '1'){
                value.append("0,");
            }
        }
        //第二组 四个信号
        String fourSingle = allBinaryString.substring(NORMAL_DEVICE.length*3,NORMAL_DEVICE.length*3+4);
        //信号的顺序是：0位开到位、1位关到位、2位开启、3位关闭
//        if(fourSingle.charAt(0) == '1'){
//            System.out.println(ELECTRIC_DEVICE[0]+"已开到位");
//        }
//        if(fourSingle.charAt(1) == '1'){
//            System.out.println(ELECTRIC_DEVICE[0]+"关到位");
//        }
        if(fourSingle.charAt(2) == '1'){
            value.append("1,");
            System.out.println(ELECTRIC_DEVICE[0]+"已启动");
        }
        if(fourSingle.charAt(3) == '1'){
            value.append("0,");
            System.out.println(ELECTRIC_DEVICE[0]+"已关闭");
        }
        //第三组一个信号
        int index = NORMAL_DEVICE.length*3+4;
        for(int i=index,j=0;i<allBinaryString.length()-2;i++,j++){
            char single = allBinaryString.charAt(i);
//            System.out.println(single);
            if(single == '1'){
                value.append("1,");
            }else{
                value.append("0,");
            }
        }
        //系统是否处于运行。。。todo
        value.append("1,");

        //泥位信号数值
        int mudStartIndex = 36;
        int mudEndIndex = 44;
        String mudHex=message.substring(mudStartIndex,mudEndIndex);
        Float mudValue=Float.intBitsToFloat(Integer.valueOf(mudHex, 16));
        value.append(mudValue).append(",");
        System.out.println("泥位信号数值是："+mudValue);
        return value.toString();
    }

    private static String getBinaryString(String allHexString) {
        StringBuilder string = new StringBuilder();
        for(int i=0;i<allHexString.length();i=i+2){
            string.append(new StringBuilder(hexString2binaryString(allHexString.substring(i,i+2))).reverse());
        }
        return string.toString();
    }

    /**
     * 十六进制转为二进制
     *
     * @param hexString
     * @return
     */
    public static String hexString2binaryString(String hexString) {
        if (hexString == null || hexString.length() % 2 != 0)
            return null;
        String bString = "", tmp;
        for (int i = 0; i < hexString.length(); i++) {
            tmp = "0000"
                    + Integer.toBinaryString(Integer.parseInt(hexString
                    .substring(i, i + 1), 16));
            bString += tmp.substring(tmp.length() - 4);
        }
        return bString;
    }

    public static String bytesToHexString(byte[] src) {

        StringBuilder stringBuilder = new StringBuilder("");
        if (src == null || src.length <= 0) {
            return null;
        }
        for (int i = 0; i < src.length; i++) {
            int v = src[i] & 0xFF;
            String hv = Integer.toHexString(v);
            if (hv.length() < 2) {
                stringBuilder.append(0);
            }
            stringBuilder.append(hv);
        }
        return stringBuilder.toString();

    }
}
