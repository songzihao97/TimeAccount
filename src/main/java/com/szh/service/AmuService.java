package com.szh.service;

import com.szh.domain.AmuAccount;
import com.szh.domain.AmuType;
import com.szh.domain.Total;

import java.util.List;

public interface AmuService {

    //查询所有学习日程类型
    List<AmuType> findAllAmuType();

    //查询所有学习日程
    List<AmuAccount> findAllAmuAccount();

    //根据id查询用户所有学习日程
    List<AmuAccount> findAllAmuAccountById(Integer userId);

    //增加学习日程
    void addAmu(AmuAccount amuAccount);

    //修改学习日程
    void updateAmu(AmuAccount amuAccount);

    //删除日程
    void delAmu(Integer AmuId);

    //根据AmuId查询日程
    AmuAccount findAmuByLId(Integer AmuId);

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
    List<AmuAccount> fuzzySelect(AmuAccount amuAccount);

}
