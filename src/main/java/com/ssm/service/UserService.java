package com.ssm.service;

import com.ssm.bean.User;
import com.ssm.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 用户信息Service
 */
@Service
public class UserService {

    @Autowired
    private UserMapper userMapper;

    public User get(Integer id) {
        return userMapper.get(id);
    }

    public List<User> findList(User user) {
        return userMapper.findList(user);
    }

    public void save(User user) {
        //根据id是否为空，来判断是添加还是修改
        if (user.getId() == null || user.getId() == 0) {
            userMapper.insert(user);
        } else {
            userMapper.update(user);
        }
    }

    public int delete(String id) {
        return userMapper.delete(id);
    }

    public User identity(String name, String password, String auth) {
        List<User> list = userMapper.identity(name, password, auth);
        if (list != null && !list.isEmpty()) {
            return list.get(0);
        }
        return new User();
    }
}