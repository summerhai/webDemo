package cn.com.retrans.utils;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.net.InetSocketAddress;
import java.nio.ByteBuffer;
import java.nio.channels.SelectionKey;
import java.nio.channels.Selector;
import java.nio.channels.ServerSocketChannel;
import java.nio.channels.SocketChannel;
import java.nio.charset.Charset;
import java.util.Iterator;
import java.util.Set;

/**
 * @author Administrator
 * 数据如何来，如何处理
 */
public class DataCollectService {
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
//        String message = "EEEE000100010001040C75DBB66DDBB62A7D40000000DADD";
//        processMessage(message);
        try {
            startServer(Constants.SERVER_IP, Constants.SERVER_PORT);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void startServer(String serverIp, int serverPort) throws IOException {
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
                    processMessage(message);
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
     * @param message
     */
    private static void processMessage(String message) {
        if (message.length() == 48 && message.charAt(7) == '1') {
            //命令1
            processMessage1(message);
        }else if(message.length() == 36 && message.charAt(7) == '2'){
            //命令2
            processMessage2(message);
        }else if(message.length() == 26 && message.charAt(7) == '3'){
            //命令3
            processMessage3(message);
        }
    }

    /**
     * EE EE 00 03 00 01 00 02 02 01 a[0]  xx（前面所有字节累加和）  DD
     * eeee0003000100020201          11    F6DD
     * @param message
     */
    private static void processMessage3(String message) {
        String a0Hex = message.substring(20,22);
        String a0Binary = hexString2binaryString(a0Hex);
        if(a0Binary.charAt(3) == '1'){
            System.out.println("有水信号");
        }else{
            System.out.println("没有水信号");
        }
        if(a0Binary.charAt(7) == '1'){
            System.out.println("有烟信号");
        }else{
            System.out.println("没有烟信号");
        }
    }

    /**
     *EE EE 00 02 00 01 00 02 04 06 d[0] d[1] d[2] d[3] d[4] d[5] xx（前面所有字节累加和）  DD
     * 数据2：eeee0002000100020406   00   c8   00   96   01   04  32dd
     * @param message
     */
    private static void processMessage2(String message) {
        //d0和d1计算环境湿度，公式是(d0*256+d1)/10
        float envHumidity = commonCompute(message.substring(20,22),message.substring(22,24));
        System.out.println("环境湿度是:"+envHumidity+"%RH");
        //d2和d3计算环境温度，公式是(d2*256+d3)/10
        float envTemperature = commonCompute(message.substring(24,26),message.substring(26,28));
        System.out.println("环境温度是:"+envTemperature+"度");
        //d4和d5计算电缆温度，公式是(d4*256+d5)/10
        float cableTemperature = commonCompute(message.substring(28,30),message.substring(30,32));
        System.out.println("电缆温度是:"+cableTemperature+"度");
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
    private static void processMessage1(String message) {
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
            if(single.charAt(0) == '1'){
                System.out.println(deviceName+"正在运行");
            }
            if(single.charAt(1) == '1'){
                System.out.println(deviceName+"设备已故障");
            }
            if(single.charAt(2) == '1'){
                System.out.println(deviceName+"已启动");
            }else{
                System.out.println(deviceName+"未启动");
            }
        }
        //第二组 四个信号
        String fourSingle = allBinaryString.substring(NORMAL_DEVICE.length*3,NORMAL_DEVICE.length*3+4);
        //信号的顺序是：0位开到位、1位关到位、2位开启、3位关闭
        if(fourSingle.charAt(0) == '1'){
            System.out.println(ELECTRIC_DEVICE[0]+"已开到位");
        }
        if(fourSingle.charAt(1) == '1'){
            System.out.println(ELECTRIC_DEVICE[0]+"关到位");
        }
        if(fourSingle.charAt(2) == '1'){
            System.out.println(ELECTRIC_DEVICE[0]+"已启动");
        }
        if(fourSingle.charAt(3) == '1'){
            System.out.println(ELECTRIC_DEVICE[0]+"已关闭");
        }
        //第三组一个信号
        int index = NORMAL_DEVICE.length*3+4;
        for(int i=index,j=0;i<allBinaryString.length()-2;i++,j++){
            String deviceName = OTHER_DEVICE[j];
            char single = allBinaryString.charAt(i);
//            System.out.println(single);
            //信号的顺序是：0位运行
            if(single == '1'){
                System.out.println(deviceName+"开关打开");
            }else{
                System.out.println(deviceName+"开关关闭");
            }
        }
        //泥位信号数值
        int mudStartIndex = 36;
        int mudEndIndex = 44;
        String mudHex=message.substring(mudStartIndex,mudEndIndex);
        Float value=Float.intBitsToFloat(Integer.valueOf(mudHex, 16));
        System.out.println("泥位信号数值是："+value);

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
