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

### remember me 持久化策略：
1. 用户选择了 “记住我” 成功登录后，将会把 username、随机产生的序列号、生成的 token 存入一个数据库表中，同时将它们的组合生成一个 cookie 发送给客户端浏览器。
2. 当下一次没有登录的用户访问系统时，首先检查 cookie，如果对应 cookie 中包含的 username、序列号和 token 与数据库中保存的一致，则表示其通过验证，系统将重新生成一个新的 token 替换数据库中对应组合的旧 token，序列号保持不变，同时删除旧的 cookie，重新生成包含新生成的 token，就的序列号和 username 的 cookie 发送给客户端。
3. 如果检查 cookie 时，cookie 中包含的 username 和序列号跟数据库中保存的匹配，但是 token 不匹配。这种情况极有可能是因为你的 cookie 被人盗用了，由于盗用者使用你原本通过认证的 cookie 进行登录了导致旧的 token 失效，而产生了新的 token。这个时候 Spring Security 就可以发现 cookie 被盗用的情况，它将删除数据库中与当前用户相关的所有 token 记录，这样盗用者使用原有的 cookie 将不能再登录，同时提醒用户其帐号有被盗用的可能性。
4. 如果对应 cookie 不存在，或者包含的 username 和序列号与数据库中保存的不一致，那么将会引导用户到登录页面。

> 由于静态文件Metronic非开源，可以进群获取静态文件资源,然后放在framework/admin/src/main/resources/static目录下，更改sharedVariables.ossPath=/
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