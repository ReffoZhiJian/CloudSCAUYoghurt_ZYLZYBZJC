package com.zylzyb.SCAUYoghurt.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zylzyb.SCAUYoghurt.common.R;
import com.zylzyb.SCAUYoghurt.entity.Category;
import com.zylzyb.SCAUYoghurt.service.CategoryService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 分类管理
 */
@RestController
@RequestMapping("/category")
@Slf4j
public class CategoryController {
    @Autowired
    private CategoryService categoryService;

    /**
     * 新增分类 //@ZYL：增
     * @param category
     * @return
     */
    @PostMapping
    public R<String> save(@RequestBody Category category){
        log.info("category:{}",category);
        categoryService.save(category);
        return R.success("新增分类成功");
    }

    /**
     * 分页查询 //@ZYL：查
     * @param page
     * @param pageSize
     * @return
     */
    @GetMapping("/page")
    public R<Page> page(int page,int pageSize){
        //分页构造器
        Page<Category> pageInfo = new Page<>(page,pageSize);
//        //条件构造器
//        LambdaQueryWrapper<Category> queryWrapper = new LambdaQueryWrapper<>();
//        //添加排序条件，根据sort进行排序
//        queryWrapper.orderByAsc(Category::getSort);

        //分页查询
        categoryService.page(pageInfo,
                new LambdaQueryWrapper<Category>().orderByAsc(Category::getSort));
        //@ZYL：↑-ZYL己改 把条件构造器直接传参进去，使代码更简洁~ /再
        return R.success(pageInfo);
    }

    /**
     * 根据id删除分类 //@ZYL：删
     * @param id
     * @return
     */
    @DeleteMapping
    public R<String> delete(Long id){
        log.info("删除分类，id为：{}",id);

        //categoryService.removeById(id);
        categoryService.remove(id);
        //@ZYL：是处remove为先判断该category下是否有dish，没有则才调removeById-真删  * ok （remove-判断后决定删不删，removeById-直
        // 接真删  ）

        return R.success("分类信息删除成功");
    }

    /**
     * 根据id修改分类信息 //@ZYL：改
     * @param category
     * @return
     */
    @PutMapping
    public R<String> update(@RequestBody Category category){
        log.info("修改分类信息：{}",category);

        categoryService.updateById(category);

        return R.success("修改分类信息成功");
    }

    /**
     * 根据条件查询分类数据
     * @param category
     * @return
     */
    //@ZYL：↓-对应如“http://localhost:8080/category/list?type=1”者（*-此处前端的type能自动对应到后端Controller层方法参数中的
    // “Category category”  是“魔法”-先记.往后/再  ）*~！z ok /d
    @GetMapping("/list")
    public R<List<Category>> list(Category category){
        //条件构造器
        LambdaQueryWrapper<Category> queryWrapper = new LambdaQueryWrapper<>();
        //添加条件
        queryWrapper.eq(category.getType() != null,Category::getType,category.getType());
        //添加排序条件
        queryWrapper.orderByAsc(Category::getSort).orderByDesc(Category::getUpdateTime);

        List<Category> list = categoryService.list(queryWrapper);
        return R.success(list);
    }
}
