package com.framework.core.modules.sys.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.framework.core.modules.sys.entity.UserRole;

import java.util.List;

/**
 * <p>
 * 用户角色 Mapper 接口
 * </p>
 *
 * @author Sun.Han
 * @since 2017-02-22
 */
public interface UserRoleMapper extends BaseMapper<UserRole> {

    List<String> getRoleIdsByUserId(Integer userId);
}