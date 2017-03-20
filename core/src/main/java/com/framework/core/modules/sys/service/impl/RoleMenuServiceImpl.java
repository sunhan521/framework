package com.framework.core.modules.sys.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.framework.core.modules.sys.entity.RoleMenu;
import com.framework.core.modules.sys.mapper.RoleMenuMapper;
import com.framework.core.modules.sys.service.RoleMenuService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 角色菜单 服务实现类
 * </p>
 *
 * @author Sun.Han
 * @since 2017-02-22
 */
@Service
public class RoleMenuServiceImpl extends ServiceImpl<RoleMenuMapper, RoleMenu> implements RoleMenuService {

    @Autowired
    private RoleMenuService roleMenuService;

    @Override
    public void saveRoleMenu(Integer roleId, String menuIds) {
        if (StringUtils.isNotBlank(menuIds)) {
            List<RoleMenu> list = new ArrayList<>();
            String[] menuIdList = menuIds.split(",");

            for (String menuId : menuIdList) {
                RoleMenu roleMenu = new RoleMenu();
                roleMenu.setRoleId(roleId);
                roleMenu.setMenuId(Integer.parseInt(menuId));
                list.add(roleMenu);
            }
            Map<String, Object> map = new HashMap<>();
            map.put("role_id", roleId);
            roleMenuService.deleteByMap(map);
            roleMenuService.insertBatch(list);
        }
    }

    @Override
    public List<String> getMenuIdsByRoleId(Integer roleId) {
        return baseMapper.getMenuIdsByRoleId(roleId);
    }

}
