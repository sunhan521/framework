package com.framework.admin.security;

import com.framework.admin.security.model.AuthUserFactory;
import com.framework.core.modules.sys.entity.User;
import com.framework.core.modules.sys.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

@Component
public class UserDetailsServiceImpl implements UserDetailsService {

    @Autowired
    private UserService userService;

    @Override
    public UserDetails loadUserByUsername(String loginName) throws UsernameNotFoundException {
        User select = new User();
        select.setLoginName(loginName);
        select.setEnabled(true);
        User user = userService.getUserByLoginName(loginName);
        if (user == null) {
            throw new UsernameNotFoundException(loginName);
        }else {
            return AuthUserFactory.create(user);
        }

    }
}
