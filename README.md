# CloudSCAUYoghurt_ZYLZYBZJC


#### 项目源码地址: 

- 码云Gittee地址: https://gitee.com/reffozhijian/CloudSCAUYoghurt_ZYLZYBZJC

- GitHub地址: https://github.com/reffozhijian/CloudSCAUYoghurt_ZYLZYBZJC


#### 介绍：
2022.10-2023.04————云上华农酸奶展销部—————后端开发（3人团队）
#### 项目描述：
采用 Spring Boot、MyBatis-Plus、Redis、MySQL 等技术实现的华农酸奶展销管理及选购平台（后端开发：ZYL、ZYB；前端开发：ZJC）。
#### 我的成果：
- 使用Spring Boot技术栈及Redis，实现管理员端及用户选购端的基本功能并添加缓存；
- 通过Linux系统配置MySQL主从复制读写分离，减轻数据库负担，增大系统承受能力； 
- 使用Nginx对服务器反向代理，实现前后端工程在Linux系统的分离部署及上线访问。

#### 安装教程：

1.  在src/main/resources/ **application.yml** 文件中修改Redis、MySQL的账户地址及密码等（修改为自己的）；
2.  在自己的本地数据库新建SCAUYoghurt数据库，并在该数据库下运行src/main/resources/ **SCAUYoghurt.sql** 文件，启动自己在yml文件中相应的Redis等配置；
3.  在IDEA中运行src/main/java/com/zylzyb/SCAUYoghurt/**SCAUYoghurtApplication.java**文件；
4.  成功运行完上述文件后，访问  http://localhost:8080/backend/page/login/login.html  地址即可进入华农酸奶展销部后台管理端，访问
    http://localhost:8080/front/page/login.html  （并开启F12调试页面视图效果为手机app模式）即可进入华农酸奶展销部前台用户端（手机登录验证码在IDEA控制台查看获取）。
