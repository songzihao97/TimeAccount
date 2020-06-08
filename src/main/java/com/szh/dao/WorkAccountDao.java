package com.szh.dao;

import com.szh.domain.LeaAccount;
import com.szh.domain.Total;
import com.szh.domain.WorkAccount;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface WorkAccountDao {

    //查询所有日程
    List<WorkAccount> findAllWorkAccount();

    //查询所有学习日程包含日程类型名称
    List<WorkAccount> findContainTN();

    //根据id所有日程
    List<WorkAccount> findContainTNById(Integer uid);

    //添加日程
    void addWork(WorkAccount workAccount);

    //修改日程
    void updateWork(WorkAccount workAccount);

    //删除日程
    void delWork(Integer id);

    //根据WorkId查询
    WorkAccount findById(Integer id);

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
    List<WorkAccount> fuzzySelect(WorkAccount workAccount);
}
