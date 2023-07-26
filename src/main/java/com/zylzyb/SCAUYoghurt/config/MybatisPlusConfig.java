package com.zylzyb.SCAUYoghurt.config;

import com.baomidou.mybatisplus.extension.plugins.MybatisPlusInterceptor;
import com.baomidou.mybatisplus.extension.plugins.inner.PaginationInnerInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * 配置MP的分页插件//@ZYL：∝-MyBatisPlus的分页功能，语法格式etc-先记./再   /★~  ！
 */
@Configuration
public class MybatisPlusConfig {

    @Bean
    public MybatisPlusInterceptor mybatisPlusInterceptor(){
        MybatisPlusInterceptor mybatisPlusInterceptor = new MybatisPlusInterceptor();
        mybatisPlusInterceptor.addInnerInterceptor(new PaginationInnerInterceptor());
        return mybatisPlusInterceptor;
//  //@ZYL：↑三段/可改为:
//        return new MybatisPlusInterceptor().addInnerInterceptor(new PaginationInnerInterceptor());
    }
}
