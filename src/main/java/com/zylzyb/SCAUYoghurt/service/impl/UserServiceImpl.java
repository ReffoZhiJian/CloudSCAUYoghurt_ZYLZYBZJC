package com.zylzyb.SCAUYoghurt.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zylzyb.SCAUYoghurt.entity.User;
import com.zylzyb.SCAUYoghurt.mapper.UserMapper;
import com.zylzyb.SCAUYoghurt.service.UserService;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {
}
