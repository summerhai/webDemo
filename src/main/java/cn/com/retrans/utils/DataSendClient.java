package cn.com.retrans.utils;

import java.io.*;
import java.net.InetSocketAddress;
import java.nio.ByteBuffer;
import java.nio.channels.SelectionKey;
import java.nio.channels.Selector;
import java.nio.channels.SocketChannel;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class DataSendClient {
    public static List<String> testDataList = new ArrayList<>();
    /**
     * @param args
     */
    public static void main(String[] args) {
        try {
            initDataList();
            startClient(Constants.SERVER_IP, Constants.SERVER_PORT);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private static void initDataList() throws IOException {
        String filePath = "C:\\Users\\Administrator\\Desktop\\webDemo项目\\test_data.txt";
        File file = new File(filePath);
        BufferedReader reader = new BufferedReader(new FileReader(file));
        String line = reader.readLine();
        while(line != null){
            testDataList.add(line);
            line = reader.readLine();
        }
        reader.close();
    }

    public static void startClient(String serverIp, int serverPort) throws IOException{
        /*
         * 创建一个SocketChannel，指定为非阻塞模式
         * A selectable channel for stream-oriented connecting sockets.
         */
        SocketChannel socketChannel = SocketChannel.open();
        socketChannel.configureBlocking(false);

        /*
         * 连接到指定的服务地址
         */
        socketChannel.connect(new InetSocketAddress(serverIp, serverPort));

        /*
         * 创建一个事件选择器Selector
         */
        Selector selector = Selector.open();

        /*
         * 将创建的SocketChannel注册到指定的Selector上，并指定关注的事件类型为OP_CONNECT
         */
        socketChannel.register(selector, SelectionKey.OP_CONNECT);

        /*
         * 从系统输入终端读取数据，作为客户端信息输入源
         */
        String cont = null;
        int dataIndex = 0;
        int dataIndexEnd = testDataList.size();
        while(true){
            if(socketChannel.isConnected()){
                cont = testDataList.get(dataIndex);
                socketChannel.write(Charset.forName("UTF-8").encode(cont));
                dataIndex++;
                if(dataIndex == dataIndexEnd || cont == null || cont.equalsIgnoreCase(Constants.CLIENT_CLOSE)){
                    socketChannel.close();
                    selector.close();
                    System.out.println("See you, 客户端退出系统了");
                    System.exit(0);
                }
            }
            /*
             * 设置1sec的超时时间，进行IO事件选择操作
             */
            int nSelectedKeys = selector.select(5000);
            if(nSelectedKeys > 0){
                for(SelectionKey skey: selector.selectedKeys()){
                    /*
                     * 判断检测到的channel是不是可连接的，将对应的channel注册到选择器上，指定关心的事件类型为OP_READ
                     */
                    if(skey.isConnectable()){
                        SocketChannel connChannel = (SocketChannel) skey.channel();
                        connChannel.configureBlocking(false);
                        connChannel.register(selector, SelectionKey.OP_READ);
                        connChannel.finishConnect();
                    }
                    /*
                     * 若检测到的IO事件是读事件，则处理相关数据的读相关的业务逻辑
                     */
                    else if(skey.isReadable()){
                        SocketChannel readChannel = (SocketChannel) skey.channel();
                        StringBuilder sb = new StringBuilder();
                        /*
                         * 定义一个ByteBuffer的容器，容量为1k
                         */
                        ByteBuffer byteBuffer = ByteBuffer.allocate(1024);

                        int readBytes = 0;
                        int ret = 0;
                        /*
                         * 注意，对ByteBuffer的操作，需要关心的是flip，clear等。
                         */
                        while ((ret = readChannel.read(byteBuffer)) > 0) {
                            readBytes += ret;
                            byteBuffer.flip();
                            sb.append(Charset.forName("UTF-8").decode(byteBuffer).toString());
                            byteBuffer.clear();
                        }

                        if (readBytes == 0) {
                            System.err.println("handle opposite close Exception");
                            readChannel.close();
                        }
                    }
                }
                /*
                 * 一次监听的事件处理完毕后，需要将已经记录的事件清除掉，准备下一轮的事件标记
                 */
                selector.selectedKeys().clear();
            }else{
                System.err.println("handle select timeout Exception");
                socketChannel.close();
            }
        }
    }
}
