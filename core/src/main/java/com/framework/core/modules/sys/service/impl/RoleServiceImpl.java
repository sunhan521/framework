package com.framework.core.modules.sys.service.impl;

import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.framework.core.modules.sys.entity.Role;
import com.framework.core.modules.sys.mapper.RoleMapper;
import com.framework.core.modules.sys.service.RoleService;
import com.framework.core.po.KeyValue;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * <p>
 * 系统角色 服务实现类
 * </p>
 *
 * @author Sun.Han
 * @since 2017-02-22
 */
@Service
public class RoleServiceImpl extends ServiceImpl<RoleMapper, Role> implements RoleService {


    public List<KeyValue> getRoleKv(){
        List<Role> roles = baseMapper.selectList(null);
        List<KeyValue> kv = new ArrayList<>();
        for (Role role:roles){
            kv.add(new KeyValue(role.getId().toString(),role.getName()));
        }
        return kv;
    }

}
