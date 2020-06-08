package com.szh.utils;

import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//异常处理
public class SysExceptionResolver implements HandlerExceptionResolver {

    @Override
    public ModelAndView resolveException(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) {
        //打印异常信息
        e.printStackTrace();
        //转发至异常页面
        ModelAndView mv=new ModelAndView();
        mv.setViewName("error");
        return mv;
    }
}
