package com.framework.admin.security.model;


import com.framework.core.modules.sys.entity.Menu;
import com.framework.core.modules.sys.entity.Role;
import com.framework.core.modules.sys.entity.User;
import org.apache.commons.lang3.StringUtils;
import org.springframework.security.core.authority.SimpleGrantedAuthority;

import java.util.List;
import java.util.stream.Collectors;

/**
 * @author Han.Sun
 */
public final class AuthUserFactory {

    private AuthUserFactory() {
    }

    /**
     * Create auth user.
     *
     * @param user the user
     * @return the auth user
     */
    public static AuthUser create(User user) {
        AuthUser authUser = new AuthUser(user.getId());
        authUser.setLoginName(user.getLoginName());
        authUser.setName(user.getName());
        authUser.setEmail(user.getEmail());
        authUser.setPhone(user.getPhone());
        authUser.setMobile(user.getMobile());
        authUser.setPassword(user.getPassword());
        authUser.setEnabled(user.isEnabled());
        authUser.setAuthorities(mapToGrantedAuthorities(user.getRoles(), user.getMenus()));
        return authUser;
    }
    /**
     * 权限转换
     *
     * @param roles 角色列表
     * @param menus 菜单列表
     * @return 权限列表
     */
    private static List<SimpleGrantedAuthority> mapToGrantedAuthorities(List<Role> roles, List<Menu> menus) {

        List<SimpleGrantedAuthority> authorities =
                roles.stream().filter(Role::isEnabled)
                        .map(sysRole -> new SimpleGrantedAuthority(sysRole.getName())).collect(Collectors.toList());
        // 添加基于Permission的权限信息
        menus.stream().filter(menu -> StringUtils.isNotBlank(menu.getPermission())).forEach(menu -> {
            // 添加基于Permission的权限信息
            for (String permission :StringUtils.split(menu.getPermission(), ",")) {
                authorities.add(new SimpleGrantedAuthority(permission));
            }
        });
        return authorities;
    }

}
