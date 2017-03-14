package com.framework.admin.security.model;

import org.springframework.security.core.userdetails.UserDetails;

/**
 * @author Han.Sun
 */
public abstract class AbstractAuthUser implements UserDetails {

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

}
