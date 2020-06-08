package com.szh.utils;

import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 自定义拦截器
 */
public class MyInterceptor implements HandlerInterceptor {
    //验证是否登录
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        if (session.getAttribute("loginUser") != null) {
            //已登录放行
            return true;
        }else {
            ///未登录跳转至登录界面
            request.setAttribute("msg","您还未登录，请先登录！");
            request.getRequestDispatcher("/index.jsp").forward(request,response);
            return false;
        }
    }
}
