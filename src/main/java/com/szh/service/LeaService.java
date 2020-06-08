package com.szh.service;

import com.szh.domain.LeaAccount;
import com.szh.domain.LearnType;
import com.szh.domain.Total;

import java.util.List;

public interface LeaService {

    //查询所有学习日程类型
    List<LearnType> findAllLearnType();

    //查询所有学习日程
    List<LeaAccount> findAllLeaAccount();

    //根据id查询用户所有学习日程
    List<LeaAccount> findAllLeaAccountById(Integer userId);

    //增加学习日程
    void addLea(LeaAccount leaAccount);

    //修改学习日程
    void updateLea(LeaAccount leaAccount);

    //删除日程
    void delLea(Integer LeaId);

    //根据LeaId查询日程
    LeaAccount findLeaByLId(Integer LeaId);

    //查询所有记录的分类统计信息
    List<Total> total(int id);

    //查询近七天记录的分类统计信息
    List<Total> totalWeeK(int id);

    //查询近七天记录的分类统计信息
    List<Total> totalMonth(int id);

    //不分类查询总记录时间
    Total totalAll(Integer id);
    //不分类查询近一周总记录时间
    Total totalAllWeek(Integer id);
    //不分类查询近一月总记录时间
    Total totalAllMonth(Integer id);
    //按照条件模糊查询
    List<LeaAccount> fuzzySelect(LeaAccount leaAccount);
}
