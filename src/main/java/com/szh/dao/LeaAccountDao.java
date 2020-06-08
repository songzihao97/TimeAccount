package com.szh.dao;

import com.fasterxml.jackson.annotation.JsonTypeInfo;
import com.szh.domain.LeaAccount;
import com.szh.domain.Total;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface LeaAccountDao {

    //查询所有学习日程
    List<LeaAccount> findAllLeaAccount();

    //查询所有学习日程包含日程类型名称
    List<LeaAccount> findContainTN();

    //根据id所有学习日程
    List<LeaAccount> findContainTNById(Integer uid);

    //添加学习日程
    void addLea(LeaAccount leaAccount);

    //修改学习日程
    void updateLea(LeaAccount leaAccount);

    //删除日程
    void delLea(Integer id);

    //根据LeaId查询
    LeaAccount findById(Integer id);

    //根据类型统计时间
    List<Total> total(Integer id);
    //根据类型统计近一星期数据
    List<Total> totalForWeek(Integer id);
    //根据类型统计近一个月数据
    List<Total> totalForMonth(Integer id);
    //不分类查询总记录时间
    Total totalAll(Integer id);
    //不分类查询总记录时间
    Total totalAllWeek(Integer id);
    //不分类查询总记录时间
    Total totalAllMonth(Integer id);

    //模糊查询
    List<LeaAccount> fuzzySelect(LeaAccount leaAccount);
}
