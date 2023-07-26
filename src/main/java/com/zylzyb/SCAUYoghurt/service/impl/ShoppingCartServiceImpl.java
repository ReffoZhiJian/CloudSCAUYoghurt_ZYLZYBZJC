package com.zylzyb.SCAUYoghurt.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zylzyb.SCAUYoghurt.entity.ShoppingCart;
import com.zylzyb.SCAUYoghurt.mapper.ShoppingCartMapper;
import com.zylzyb.SCAUYoghurt.service.ShoppingCartService;
import org.springframework.stereotype.Service;

@Service
public class ShoppingCartServiceImpl extends ServiceImpl<ShoppingCartMapper, ShoppingCart> implements ShoppingCartService {

}
