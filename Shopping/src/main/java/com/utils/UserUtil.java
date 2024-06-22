package com.utils;

import com.pojo.User;

import javax.servlet.http.HttpSession;

public class UserUtil {
    private static HttpSession session;

    public static boolean isUserExist(){
        //判断session是否有用户数据
        User user = (User) session.getAttribute("user");

        if (user==null){
            return false;
        }
        return true;
    }
}
