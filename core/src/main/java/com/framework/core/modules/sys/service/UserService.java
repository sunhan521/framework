package com.framework.core.modules.sys.service;

import com.framework.core.modules.sys.entity.User;
import com.baomidou.mybatisplus.service.IService;

/**
 * <p>
 * 系统用户 服务类
 * </p>
 *
 * @author Sun.Han
 * @since 2017-02-22
 */
public interface UserService extends IService<User> {
     User getUserByLoginName(String loginName);

     void editRole(User user);
}
