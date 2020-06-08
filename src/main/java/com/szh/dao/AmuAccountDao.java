package com.szh.dao;

import com.szh.domain.AmuAccount;
import com.szh.domain.Total;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AmuAccountDao {

    //查询所有学习日程
    List<AmuAccount> findAllAmuAccount();

    //查询所有学习日程包含日程类型名称
    List<AmuAccount> findContainTN();

    //根据id所有学习日程
    List<AmuAccount> findContainTNById(Integer uid);

    //添加学习日程
    void addAmu(AmuAccount amuAccount);

    //修改学习日程
    void updateAmu(AmuAccount amuAccount);

    //删除日程
    void delAmu(Integer id);

    //根据AmuId查询
    AmuAccount findById(Integer id);

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
    List<AmuAccount> fuzzySelect(AmuAccount amuAccount);
}
