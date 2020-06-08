package com.szh.dao;

import com.szh.domain.AmuType;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AmuTypeDao {

    //查询所有学习日程类型
    List<AmuType> findAllAmuType();
}
