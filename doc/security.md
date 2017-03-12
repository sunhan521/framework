### remember me 持久化策略：
1. 用户选择了 “记住我” 成功登录后，将会把 username、随机产生的序列号、生成的 token 存入一个数据库表中，同时将它们的组合生成一个 cookie 发送给客户端浏览器。
2. 当下一次没有登录的用户访问系统时，首先检查 cookie，如果对应 cookie 中包含的 username、序列号和 token 与数据库中保存的一致，则表示其通过验证，系统将重新生成一个新的 token 替换数据库中对应组合的旧 token，序列号保持不变，同时删除旧的 cookie，重新生成包含新生成的 token，就的序列号和 username 的 cookie 发送给客户端。
3. 如果检查 cookie 时，cookie 中包含的 username 和序列号跟数据库中保存的匹配，但是 token 不匹配。这种情况极有可能是因为你的 cookie 被人盗用了，由于盗用者使用你原本通过认证的 cookie 进行登录了导致旧的 token 失效，而产生了新的 token。这个时候 Spring Security 就可以发现 cookie 被盗用的情况，它将删除数据库中与当前用户相关的所有 token 记录，这样盗用者使用原有的 cookie 将不能再登录，同时提醒用户其帐号有被盗用的可能性。
4. 如果对应 cookie 不存在，或者包含的 username 和序列号与数据库中保存的不一致，那么将会引导用户到登录页面。