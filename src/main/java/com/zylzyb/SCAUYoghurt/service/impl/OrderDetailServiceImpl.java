package com.zylzyb.SCAUYoghurt.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zylzyb.SCAUYoghurt.entity.OrderDetail;
import com.zylzyb.SCAUYoghurt.mapper.OrderDetailMapper;
import com.zylzyb.SCAUYoghurt.service.OrderDetailService;
import org.springframework.stereotype.Service;

@Service
public class OrderDetailServiceImpl extends ServiceImpl<OrderDetailMapper, OrderDetail> implements OrderDetailService {

}
