package com.zylzyb.SCAUYoghurt.dto;

import com.zylzyb.SCAUYoghurt.entity.Setmeal;
import com.zylzyb.SCAUYoghurt.entity.SetmealDish;
import lombok.Data;
import java.util.List;

@Data
public class SetmealDto extends Setmeal {

    private List<SetmealDish> setmealDishes;

    private String categoryName;
}
