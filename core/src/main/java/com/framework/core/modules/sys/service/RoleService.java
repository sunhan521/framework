package com.framework.core.modules.sys.service;

import com.framework.core.modules.sys.entity.Role;
import com.baomidou.mybatisplus.service.IService;
import com.framework.core.po.KeyValue;

import java.util.List;

/**
 * <p>
 * 系统角色 服务类
 * </p>
 *
 * @author Sun.Han
 * @since 2017-02-22
 */
public interface RoleService extends IService<Role> {
    List<KeyValue> getRoleKv();
	
}
