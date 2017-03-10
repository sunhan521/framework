package com.framework.core.modules.sys.service;

import com.baomidou.mybatisplus.service.IService;
import com.framework.core.modules.sys.entity.UserRole;

import java.util.List;

/**
 * <p>
 * 用户角色 服务类
 * </p>
 *
 * @author Sun.Han
 * @since 2017-02-22
 */
public interface UserRoleService extends IService<UserRole> {
    List<String> getRoleIdsByUserId(Integer userId);


}
