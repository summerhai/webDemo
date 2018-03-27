package cn.com.retrans.controller;

import java.util.Random;

/**
 * Created by mingl on 2018-3-27.
 */
public class Test {
    public static void main(String[] args) {
        Random random = new Random(8);
        for(int i=0;i<10;i++){
            double value = random.nextDouble()*10;
            System.out.println(value);
        }



    }
}
