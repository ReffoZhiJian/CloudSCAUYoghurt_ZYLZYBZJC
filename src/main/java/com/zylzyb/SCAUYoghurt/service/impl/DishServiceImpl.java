package com.zylzyb.SCAUYoghurt.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zylzyb.SCAUYoghurt.entity.DishFlavor;
import com.zylzyb.SCAUYoghurt.service.DishFlavorService;
import com.zylzyb.SCAUYoghurt.dto.DishDto;
import com.zylzyb.SCAUYoghurt.entity.Dish;
import com.zylzyb.SCAUYoghurt.mapper.DishMapper;
import com.zylzyb.SCAUYoghurt.service.DishService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Service
@Slf4j
public class DishServiceImpl extends ServiceImpl<DishMapper, Dish> implements DishService {

    @Autowired
    private DishFlavorService dishFlavorService;

    /**
     * 新增酸奶，同时保存对应的年龄/包装数据
     * @param dishDto
     */
    @Transactional
    public void saveWithFlavor(DishDto dishDto) {
        //保存酸奶的基本信息到酸奶表dish
        this.save(dishDto);

        Long dishId = dishDto.getId();//酸奶id

        //酸奶年龄/包装
        List<DishFlavor> flavors = dishDto.getFlavors();
        flavors = flavors.stream().map((item) -> {
            item.setDishId(dishId);
            return item;
        }).collect(Collectors.toList());

        //保存酸奶年龄/包装数据到酸奶年龄/包装表dish_flavor
        dishFlavorService.saveBatch(flavors);

    }

    /**
     * 根据id查询酸奶信息和对应的年龄/包装信息
     * @param id
     * @return
     */
    public DishDto getByIdWithFlavor(Long id) {
        //查询酸奶基本信息，从dish表查询
        Dish dish = this.getById(id);

        DishDto dishDto = new DishDto();
        BeanUtils.copyProperties(dish,dishDto);

        //查询当前酸奶对应的年龄/包装信息，从dish_flavor表查询
        LambdaQueryWrapper<DishFlavor> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(DishFlavor::getDishId,dish.getId());
        List<DishFlavor> flavors = dishFlavorService.list(queryWrapper);
        dishDto.setFlavors(flavors);

        return dishDto;
    }

    @Override
    @Transactional
    public void updateWithFlavor(DishDto dishDto) {
        //更新dish表基本信息
        this.updateById(dishDto);

        //清理当前酸奶对应年龄/包装数据---dish_flavor表的delete操作
        LambdaQueryWrapper<DishFlavor> queryWrapper = new LambdaQueryWrapper();
        queryWrapper.eq(DishFlavor::getDishId,dishDto.getId());

        dishFlavorService.remove(queryWrapper);

        //添加当前提交过来的年龄/包装数据---dish_flavor表的insert操作
        List<DishFlavor> flavors = dishDto.getFlavors();

        flavors = flavors.stream().map((item) -> {
            item.setDishId(dishDto.getId());
            return item;
        }).collect(Collectors.toList());

        dishFlavorService.saveBatch(flavors);
    }
}
