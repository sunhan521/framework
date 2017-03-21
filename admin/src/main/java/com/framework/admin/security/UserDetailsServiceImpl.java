package com.framework.admin.security;

import com.framework.admin.security.model.AuthUser;
import com.framework.admin.security.model.AuthUserFactory;
import com.framework.core.modules.sys.entity.User;
import com.framework.core.modules.sys.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

/**
 * @author Han.Sun
 * @since 2017年02月23日
 */
@Service
public class UserDetailsServiceImpl implements UserDetailsService {
    @Autowired
    private UserService userService;
    @Override
    public AuthUser loadUserByUsername(String loginName) throws UsernameNotFoundException {
        User user = userService.getUserByLoginName(loginName);
        if (user == null) {
            throw new UsernameNotFoundException(loginName);
        }else {
            return AuthUserFactory.create(user);
        }

    }
}
