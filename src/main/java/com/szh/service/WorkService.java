package com.szh.service;

import com.szh.domain.LeaAccount;
import com.szh.domain.Total;
import com.szh.domain.WorkAccount;
import com.szh.domain.WorkType;

import java.util.List;

public interface WorkService {

    //查询所有日程类型
    List<WorkType> findAllWorkType();

    //查询所有日程
    List<WorkAccount> findAllWorkAccount();

    //根据id查询用户所有日程
    List<WorkAccount> findAllWorkAccountById(Integer userId);

    //增加日程
    void addWork(WorkAccount workAccount);

    //修改日程
    void updateWork(WorkAccount workAccount);

    //删除日程
    void delWork(Integer WorkId);

    //根据WorkId查询日程
    WorkAccount findWorkByLId(Integer WorkId);

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
    List<WorkAccount> fuzzySelect(WorkAccount workAccount);
}
