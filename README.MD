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
    ● 前端框架：Bootstrap + Jquery
    
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

> 项目属于学习项目，希望多交流，如果有兴趣的朋友可以进群： 579585475

# 待解决
* 【功能】图形化代码生成页面
* 【bug】`was not registered for synchronization because synchronization is not active`


# 历史记录

## 2017年03月23日
* 【功能】新增druid监控 启动成功后浏览  http://localhost:8080/druid/index.html 用户名密码admin/123123
* 【功能】增加全局新增初始化

## 2017年03月21日

* 【功能】新增异常管理，异步保存异常信息
* 【bug】修复首次进入菜单页面不加载

## 2017年03月20日

* 【bug】修复管理员更新用户，密码清空的bug
* 【功能】DataTables-columns新增className（设置列表样式），dict属性（关联dict表，自动将key值转换成value）
* 【优化】重构pom文件，尽量统一引用spring-boot-dependence
* 【todo】对不常更新的表添加缓存，比如权限，菜单等等