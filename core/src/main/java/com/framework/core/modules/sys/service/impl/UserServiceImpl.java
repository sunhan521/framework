package com.framework.core.modules.sys.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.framework.core.modules.sys.entity.Menu;
import com.framework.core.modules.sys.entity.User;
import com.framework.core.modules.sys.entity.UserRole;
import com.framework.core.modules.sys.mapper.MenuMapper;
import com.framework.core.modules.sys.mapper.RoleMapper;
import com.framework.core.modules.sys.mapper.UserMapper;
import com.framework.core.modules.sys.service.UserRoleService;
import com.framework.core.modules.sys.service.UserService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 系统用户 服务实现类
 * </p>
 *
 * @author Sun.Han
 * @since 2017-02-22
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements UserService {

    @Autowired
    private RoleMapper roleMapper;

    @Autowired
    private MenuMapper menuMapper;

    @Autowired
    private UserRoleService userRoleService;

    @Override
    public User getUserByLoginName(String loginName) {
        User user = baseMapper.selectOne(new User(loginName));
        if (user == null){
            return null;
        }
        Integer userId = user.getId();

        user.setRoles(roleMapper.findListByUserId(userId));
        List<Menu> menuList;

        //超级管理员
        if (User.ADMIN_USER_ID.equals(userId)) {
            menuList = menuMapper.selectList(null);
        } else {
            menuList = menuMapper.findListByUserId(userId);
        }
        user.setMenus(menuList);
        return user;
    }

    @Override
    public void editRole(User user) {
        String roleIds = user.getRoleIds();
        if (StringUtils.isNotBlank(roleIds)) {
            List<UserRole> list = new ArrayList<>();
            Integer userId = user.getId();
            String[] roleIdArr = roleIds.split(",");
            for (String roleId : roleIdArr) {
                UserRole userRole = new UserRole();
                userRole.setUserId(userId);
                userRole.setRoleId(Integer.valueOf(roleId));
                list.add(userRole);
            }
            Map<String, Object> map = new HashMap<>();
            map.put("user_id", userId);
            userRoleService.deleteByMap(map);
            userRoleService.insertBatch(list);
        }
    }


}
