package com.zylzyb.SCAUYoghurt.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.zylzyb.SCAUYoghurt.dto.DishDto;
import com.zylzyb.SCAUYoghurt.entity.Dish;

public interface DishService extends IService<Dish> {

    //新增酸奶，同时插入酸奶对应的年龄/包装数据，需要操作两张表：dish、dish_flavor
    public void saveWithFlavor(DishDto dishDto);

    //根据id查询酸奶信息和对应的年龄/包装信息
    public DishDto getByIdWithFlavor(Long id);

    //更新酸奶信息，同时更新对应的年龄/包装信息
    public void updateWithFlavor(DishDto dishDto);
}
