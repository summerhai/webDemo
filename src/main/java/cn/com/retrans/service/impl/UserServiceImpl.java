package cn.com.retrans.service.impl;

import cn.com.retrans.dao.UserMapper;
import cn.com.retrans.pojo.User;
import cn.com.retrans.service.UserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * Created by mingyue on 2018/1/23.
 */
@Service
public class UserServiceImpl implements UserService {
    @SuppressWarnings("SpringJavaAutowiringInspection")
    @Resource
    private UserMapper userMapper;

    @Override
    public User getUserById(String id) {
        return userMapper.selectByPrimaryKey(id);
    }

    @Override
    public User getUserByName(String name) {
        return userMapper.selectUserByName(name);
    }
}
