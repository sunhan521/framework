package com.framework.core.modules.sys.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.framework.core.modules.sys.entity.UserRole;
import com.framework.core.modules.sys.mapper.UserRoleMapper;
import com.framework.core.modules.sys.service.UserRoleService;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 * 用户角色 服务实现类
 * </p>
 *
 * @author Sun.Han
 * @since 2017-02-22
 */
@Service
public class UserRoleServiceImpl extends ServiceImpl<UserRoleMapper, UserRole> implements UserRoleService {


    @Override
    public List<String> getRoleIdsByUserId(Integer userId) {
        return baseMapper.getRoleIdsByUserId(userId);
    }


}
