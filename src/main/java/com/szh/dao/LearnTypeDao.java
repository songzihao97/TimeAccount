package com.szh.dao;

import com.szh.domain.LearnType;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface LearnTypeDao {

    //查询所有学习日程类型
    List<LearnType> findAllLearnType();
}
