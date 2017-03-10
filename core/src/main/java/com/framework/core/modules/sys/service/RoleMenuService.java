package com.framework.core.modules.sys.service;

import com.framework.core.modules.sys.entity.RoleMenu;
import com.baomidou.mybatisplus.service.IService;

import java.util.List;

/**
 * <p>
 * 角色菜单 服务类
 * </p>
 *
 * @author Sun.Han
 * @since 2017-02-22
 */
public interface RoleMenuService extends IService<RoleMenu> {

    void saveRoleMenu(Integer roleId, String menuIds);

    List<String> getMenuIdsByRoleId(Integer roleId);
}
