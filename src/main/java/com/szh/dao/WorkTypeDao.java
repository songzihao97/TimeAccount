package com.szh.dao;

import com.szh.domain.WorkType;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface WorkTypeDao {

    //查询所有学习日程类型
    List<WorkType> findAllWorkType();
}
