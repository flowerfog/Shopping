package com.utils;

import org.junit.Test;

import java.util.Arrays;

public class StringUtil {
    /**
     * 以空格分隔整形数组
     * @param str 需要分隔的字符串
     * @return 一个整形数组
     */
    public static Integer[] delimitedIntegerArray(String str){
        String[] split = str.split(" ");
        Integer[] res = new Integer[split.length];
        try {
            for (int i = 0; i < split.length; i++) {
                res[i]=Integer.parseInt(split[i]);
            }
            return res;
        }catch (Exception e){
            System.out.println(e);
            res=null;
        }
        return res;
    }
    @Test
    public void test(){
        Integer[] integers = delimitedIntegerArray("1 2 3");
        System.out.println("integers = " + Arrays.toString(integers));
    }
}
