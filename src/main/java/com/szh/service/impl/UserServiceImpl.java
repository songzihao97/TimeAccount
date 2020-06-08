package com.szh.service.impl;

import com.szh.dao.UserDao;
import com.szh.domain.User;
import com.szh.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.Date;
import java.util.List;

@Service("userService")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

    @Override
    public List<User> findAllUser() {
        return userDao.findAllAndSort();
    }

    @Override
    public User loginService(String name, String password) {
        User user=userDao.findUserByNameAndPassword(name, password);
        if (user!=null){
        user.setLastLoginTime(new Date());
        userDao.updateUser(user);}
        return user;
    }

    @Override
    public void registerService(User user) {
        user.setRegisterTime(new Date());
        user.setLastLoginTime(new Date());
        userDao.addUser(user);
    }

    @Override
    public void delete(int id) {
        userDao.delete(id);
    }

    @Override
    public void updateUser(User user) {
        userDao.updateUser(user);
    }

    @Override
    public User findUserById(Integer userId) {
        User user=userDao.findUserById(userId);
        return user;
    }

}
