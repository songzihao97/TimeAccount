package com.szh.utils;

import org.springframework.core.convert.converter.Converter;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 自定义类型转换
 * 将表单传输date类型（yyyy-MM-dd）转换成java的Date类型，便于封装
 */
public class StringToDateConverter implements Converter<String, Date> {
    @Override
    public Date convert(String s) {
        // 判断
        if(s == null) {
            throw new RuntimeException("参数不能为空");
        }
        try {
            if (s.contains("-")&&s.contains(":")&&s.contains("T")){
                DateFormat df = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
                return df.parse(s);
            }else if(s.contains("-")&&s.contains(":")){
                DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm");
                return df.parse(s);
            } else if (s.contains("-")&&!s.contains(":")){
                DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
                return df.parse(s);
            }else {
                DateFormat df = new SimpleDateFormat("HH:mm");
                return df.parse(s);
            }
        } catch (Exception e) {
            throw new RuntimeException("类型转换错误");
        }
    }
}
