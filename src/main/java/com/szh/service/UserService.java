package com.szh.service;

import com.szh.domain.Total;
import com.szh.domain.User;

import java.util.List;

public interface UserService {

    /**
     * 查询所有用户
     * @return users
     */
    List<User> findAllUser();

    /**
     * 用户登录操作
     * @param name 用户名
     * @param password 密码
     * @return 用户信息
     */
    User loginService(String name,String password);

    /**
     * 用户注册
     * @param user 用户参数
     */
    void registerService(User user);

    /**
     * 根据id删除用户
     */
    void delete(int id);

    //修改用户信息
    void updateUser(User user);

    //根据id查询用户信息
    User findUserById(Integer userId);

}
