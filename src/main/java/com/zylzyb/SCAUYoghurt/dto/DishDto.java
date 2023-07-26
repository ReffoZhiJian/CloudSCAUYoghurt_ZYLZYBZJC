package com.zylzyb.SCAUYoghurt.dto;

import com.zylzyb.SCAUYoghurt.entity.Dish;
import com.zylzyb.SCAUYoghurt.entity.DishFlavor;
import lombok.Data;
import java.util.ArrayList;
import java.util.List;

@Data
public class DishDto extends Dish {

    //酸奶对应的年龄/包装数据
    private List<DishFlavor> flavors = new ArrayList<>();

    private String categoryName;

    private Integer copies;
    //@ZYL：↑作用-似乎没什么作用?  往后/再
}
