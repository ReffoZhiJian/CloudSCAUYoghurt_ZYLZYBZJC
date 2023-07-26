package com.zylzyb.SCAUYoghurt.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zylzyb.SCAUYoghurt.common.CustomException;
import com.zylzyb.SCAUYoghurt.entity.Category;
import com.zylzyb.SCAUYoghurt.entity.Dish;
import com.zylzyb.SCAUYoghurt.entity.Setmeal;
import com.zylzyb.SCAUYoghurt.mapper.CategoryMapper;
import com.zylzyb.SCAUYoghurt.service.CategoryService;
import com.zylzyb.SCAUYoghurt.service.DishService;
import com.zylzyb.SCAUYoghurt.service.SetmealService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CategoryServiceImpl extends ServiceImpl<CategoryMapper, Category> implements CategoryService {

    @Autowired
    private DishService dishService;

    @Autowired
    private SetmealService setmealService;

    /**
     * 根据id删除分类，删除之前需要进行判断
     * @param id
     */
    @Override
    public void remove(Long id) {
        LambdaQueryWrapper<Dish> dishLambdaQueryWrapper = new LambdaQueryWrapper<>();
        //添加查询条件，根据分类id进行查询
        dishLambdaQueryWrapper.eq(Dish::getCategoryId,id);
        int count1 = dishService.count(dishLambdaQueryWrapper);

        //查询当前分类是否关联了酸奶，如果已经关联，抛出一个业务异常
//        if(count1 > 0){
//@ZYL：  ↑可以简化为己写-↓（它处-同~  z ok ）：
        if(dishService.count
                (new LambdaQueryWrapper<Dish>().eq(Dish::getCategoryId,id))
                > 0){
            //已经关联酸奶，抛出一个业务异常
            throw new CustomException("当前分类下关联了酸奶，不能删除");
        }

        //查询当前分类是否关联了组合装，如果已经关联，抛出一个业务异常
        LambdaQueryWrapper<Setmeal> setmealLambdaQueryWrapper = new LambdaQueryWrapper<>();
        //添加查询条件，根据分类id进行查询
        setmealLambdaQueryWrapper.eq(Setmeal::getCategoryId,id);
        int count2 = setmealService.count(setmealLambdaQueryWrapper);
        if(count2 > 0){
            //已经关联组合装，抛出一个业务异常
            throw new CustomException("当前分类下关联了组合装，不能删除");
        }

        //正常删除分类
        this.removeById(id);
        //↑是处-this.removeById~也可以，super.removeById~ 也可以    /再
    }
}
