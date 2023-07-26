package com.zylzyb.SCAUYoghurt.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zylzyb.SCAUYoghurt.entity.Employee;
import com.zylzyb.SCAUYoghurt.mapper.EmployeeMapper;
import com.zylzyb.SCAUYoghurt.service.EmployeeService;
import org.springframework.stereotype.Service;

@Service
public class EmployeeServiceImpl extends ServiceImpl<EmployeeMapper, Employee> implements EmployeeService {
}
