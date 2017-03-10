package com.framework.core.modules.sys.mapper;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.framework.core.modules.sys.entity.Menu;

import java.util.List;

/**
 * <p>
  * 系统菜单 Mapper 接口
 * </p>
 *
 * @author Sun.Han
 * @since 2017-02-22
 */
public interface MenuMapper extends BaseMapper<Menu> {

    List<Menu> findListByUserId(Integer userId);


    Menu getMenuById(Integer id);


}