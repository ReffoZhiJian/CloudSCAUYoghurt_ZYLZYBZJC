package com.zylzyb.SCAUYoghurt.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.zylzyb.SCAUYoghurt.dto.SetmealDto;
import com.zylzyb.SCAUYoghurt.entity.Setmeal;

import java.util.List;

public interface SetmealService extends IService<Setmeal> {
    /**
     * 新增组合装，同时需要保存组合装和酸奶的关联关系
     * @param setmealDto
     */
    public void saveWithDish(SetmealDto setmealDto);

    /**
     * 删除组合装，同时需要删除组合装和酸奶的关联数据
     * @param ids
     */
    public void removeWithDish(List<Long> ids);
}
