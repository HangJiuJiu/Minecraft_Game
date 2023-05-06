package com.ssm.mapper;

import com.ssm.bean.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 用户信息DAO接口
 */
public interface UserMapper {

    public User get(@Param("id") Integer id);

    public List<User> findList(@Param("user") User entity);

    public int insert(User entity);

    public int update(User entity);

    public int delete(@Param("id") String id);

    public List<User> identity(@Param("name") String name, @Param("password") String password, @Param("auth") String auth);
}