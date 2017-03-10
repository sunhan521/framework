package com.framework.core.modules.sys.mapper;

import com.framework.core.modules.sys.entity.Role;
import com.baomidou.mybatisplus.mapper.BaseMapper;

import java.util.List;

/**
 * <p>
  * 系统角色 Mapper 接口
 * </p>
 *
 * @author Sun.Han
 * @since 2017-02-22
 */
public interface RoleMapper extends BaseMapper<Role> {


    List<Role> findListByUserId(Integer id);

}