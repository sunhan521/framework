#framework


## 技术选型
    ● 核心框架：Spring Boot 1.5.1.RELEASE
    ● 安全框架：Spring Security
    ● 任务调度：Spring + Quartz
    ● 持久层框架：MyBatis 3.4 + MyBatis-Plus 2.0+
    ● 数据库版本控制：Liquibase
    ● 数据库连接池：Alibaba Druid 1.0
    ● 缓存框架：Redis(后续改成多种缓存切换)
    ● 日志管理：logback
    ● 前端框架：Metronic + Bootstrap + Jquery
    
    
    
## 项目启动
1. 创建数据库 framework
2. 命令行启动

```bash
mvn clean install
cd core/
## 更新数据库
mvn liquibase:update
cd ../admin
mvn spring-boot:run
```

浏览器打开 localhost:8080 用户名密码：admin/123123

![菜单管理](http://git.oschina.net/uploads/images/2017/0310/184201_52b6b78b_57769.png "菜单管理")

![角色管理](http://git.oschina.net/uploads/images/2017/0310/184532_d9f4c801_57769.png "角色管理")

#### 项目属于学习项目，希望多交流，如果有兴趣的朋友可以进群： 579585475

#### 由于静态文件Metronic非开源，可以进群获取静态文件资源,然后放在framework/admin/src/main/resources/static目录下，更改sharedVariables.ossPath=/