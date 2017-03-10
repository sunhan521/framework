package com.framework.core.modules.sys.mapper;

import com.framework.core.modules.sys.entity.RoleMenu;
import com.baomidou.mybatisplus.mapper.BaseMapper;

import java.util.List;

/**
 * <p>
  * 角色菜单 Mapper 接口
 * </p>
 *
 * @author Sun.Han
 * @since 2017-02-22
 */
public interface RoleMenuMapper extends BaseMapper<RoleMenu> {
    List<String> getMenuIdsByRoleId(Integer roleId);
}