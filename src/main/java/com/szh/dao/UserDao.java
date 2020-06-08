package com.szh.dao;

import com.szh.domain.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UserDao {

    //查询所有用户
    List<User> findAllUser();

    //查询所有用户,并按照最后登录时间排序
    List<User> findAllAndSort();

    //根据用户名和密码查询
    User findUserByNameAndPassword(@Param("username") String username,@Param("password") String password);

    //更新用户信息
    void updateUser(User user);

    //保存用户
    void addUser(User user);

    //根据userId删除用户
    void delete(int id);

    //根据id查询用户
    User findUserById(Integer userId);

}
