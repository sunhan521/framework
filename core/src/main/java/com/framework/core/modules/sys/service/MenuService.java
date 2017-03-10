package com.framework.core.modules.sys.service;

import com.baomidou.mybatisplus.service.IService;
import com.framework.core.modules.sys.entity.Menu;
import com.framework.core.po.JsTree;

import java.util.List;

/**
 * <p>
 * 系统菜单 服务类
 * </p>
 *
 * @author Sun.Han
 * @since 2017-02-22
 */
public interface MenuService extends IService<Menu> {


    List<Menu> getMenuNav(Integer id);

    List<Menu> getMenuTree(Integer id);

    List<Menu> getMenuList(Integer userId);

    List<Menu> getMenuList(Menu menu);

    Menu getMenuById(Integer id);

    List<JsTree> getJsTree(Integer userId, Integer selectedId, Integer disableId);
    List<JsTree> getJsTree(Integer userId, Integer selectedId, Integer disableId,Integer roleId);

}
