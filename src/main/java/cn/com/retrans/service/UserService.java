package cn.com.retrans.service;

import cn.com.retrans.pojo.User;

/**
 * Created by mingyue on 2018/1/23.
 */
public interface UserService {
    User getUserById(String id);
    User getUserByName(String name);
}
