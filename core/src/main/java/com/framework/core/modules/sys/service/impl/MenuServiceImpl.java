package com.framework.core.modules.sys.service.impl;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.framework.core.enums.JsTreeStateEnum;
import com.framework.core.modules.sys.entity.Menu;
import com.framework.core.modules.sys.entity.User;
import com.framework.core.modules.sys.mapper.MenuMapper;
import com.framework.core.modules.sys.mapper.RoleMenuMapper;
import com.framework.core.modules.sys.service.MenuService;
import com.framework.core.po.JsTree;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 * 系统菜单 服务实现类
 * </p>
 *
 * @author Sun.Han
 * @since 2017-02-22
 */
@Service
public class MenuServiceImpl extends ServiceImpl<MenuMapper, Menu> implements MenuService {

    @Autowired
    private RoleMenuMapper roleMenuMapper;

    public void saveMenu(Menu menu,String oldParentIds){

        Menu parent = baseMapper.selectById(menu.getParentId());
        if (parent != null) {
            menu.setParentIds(parent.getParentIds() + parent.getId() + ",");
        } else {
            menu.setParentId(0);
            menu.setParentIds(",0,");
        }
        baseMapper.updateById(menu);

        // 更新子节点 parentIds
        EntityWrapper<Menu> ew = new EntityWrapper<>();
        if (menu.getParentId() != null) {
            ew.addFilter("parent_ids like {0}", "%," + menu.getId() + ",%");
        }
        List<Menu> list = baseMapper.selectList(ew);
        for (Menu e : list){
            e.setParentIds(e.getParentIds().replace(oldParentIds, menu.getParentIds()));
            baseMapper.updateById(e);
        }
    }


    @Override
    public List<Menu> getMenuNav(Integer userId) {
        return makeTree(getMenuListByUserId(userId), true);
    }


    @Override
    public List<Menu> getMenuTree(Integer userId) {
        return makeTree(getMenuListByUserId(userId), false);
    }


    @Override
    public List<Menu> getMenuList(Integer userId) {
        List<Menu> resultList = new ArrayList<>();
        sortList(resultList, getMenuListByUserId(userId), 0);
        return resultList;
    }


    public List<Menu> getMenuList(Menu menu) {
        EntityWrapper<Menu> ew = new EntityWrapper<>();
        if (menu.getParentId() != null) {
            ew.addFilter("parent_ids like {0}", "%," + menu.getParentId() + ",%");
        }
        ew.orderBy("sort");
        List<Menu> list = baseMapper.selectList(ew);
        List<Menu> resultList = new ArrayList<>();
        sortList(resultList, list, menu.getParentId());
        return makeTree(resultList, false);
    }

    public List<JsTree> getJsTree(Integer userId, Integer selectedId, Integer disableId) {
        return getJsTree(userId, selectedId, disableId, null);
    }

    public List<JsTree> getJsTree(Integer userId, Integer selectedId, Integer disableId, Integer roleId) {

        List<String> checkedIds = roleId == null ? null : roleMenuMapper.getMenuIdsByRoleId(roleId);


        List<Menu> menus = getMenuList(userId);
        List<JsTree> list = new ArrayList<>();
        for (Menu menu : menus) {
            JsTree jsTree = new JsTree();
            jsTree.setId(menu.getId().toString());
            if (menu.getParentId().equals(0)) {
                jsTree.setParent("#");
            } else {
                jsTree.setParent(menu.getParentId().toString());
            }
            jsTree.setText(menu.getName());
            if (!StringUtils.isEmpty(menu.getIcon())) {
                jsTree.setIcon(menu.getIcon());
            }
            // 如果传递过来选中的id，这进行设置
            if (selectedId != null && jsTree.getId().equals(selectedId.toString())) {
                jsTree.setState(JsTreeStateEnum.SELECTED.getJsTreeState());
            }

            if (disableId != null &&
                    (jsTree.getId().equals(disableId.toString()) ||
                            menu.getParentIds().contains("," + disableId + ",")))
                jsTree.setState(JsTreeStateEnum.DISABLED.getJsTreeState());


            if (roleId != null && checkedIds.contains(menu.getId().toString())) {
                jsTree.setState(JsTreeStateEnum.SELECTED.getJsTreeState());
            }
            list.add(jsTree);
        }
        return list;
    }

    public Menu getMenuById(Integer id) {
        return baseMapper.getMenuById(id);
    }


    /**
     * 按父子顺序排列菜单列表
     *
     * @param list       目标菜单列表
     * @param sourceList 原始菜单列表
     * @param parentId   父级编号
     */
    private void sortList(List<Menu> list, List<Menu> sourceList, Integer parentId) {
        sourceList.stream()
                .filter(menu -> menu.getParentId() != null && menu.getParentId().equals(parentId))
                .forEach(menu -> {
                    list.add(menu);
                    // 判断是否还有子节点, 有则继续获取子节点
                    sourceList.stream()
                            .filter(child -> child.getParentId() != null && child.getParentId().equals(menu.getId()))
                            .peek(child -> sortList(list, sourceList, menu.getId()))
                            .findFirst();
                });
    }


    /**
     * 获得用户菜单列表，超级管理员可以查看所有菜单
     *
     * @param userId 用户ID
     * @return 菜单列表
     */
    private List<Menu> getMenuListByUserId(Integer userId) {
        List<Menu> menuList;
        //超级管理员
        if (User.ADMIN_USER_ID.equals(userId)) {
            menuList = baseMapper.selectList(new EntityWrapper<Menu>().orderBy("sort"));
        } else {

            menuList = baseMapper.findListByUserId(userId);
        }
        return menuList;
    }

    /**
     * 构建树形结构
     *
     * @param originals 原始数据
     * @param useShow   是否使用开关控制菜单显示隐藏
     * @return 菜单列表
     */
    private List<Menu> makeTree(List<Menu> originals, boolean useShow) {

        // 构建一个Map,把所有原始数据的ID作为Key,原始数据对象作为VALUE
        Map<Integer, Menu> dtoMap = new LinkedHashMap<>();
        for (Menu node : originals) {
            // 原始数据对象为Node，放入dtoMap中。
            Integer id = node.getId();
            if (node.getShow() || !useShow) {
                dtoMap.put(id, node);
            }
        }

        List<Menu> result = new ArrayList<>();
        for (Map.Entry<Integer, Menu> entry : dtoMap.entrySet()) {
            Menu node = entry.getValue();
            Integer parentId = node.getParentId();
            if (dtoMap.get(parentId) == null) {
                // 如果是顶层节点，直接添加到结果集合中
                result.add(node);
            } else {
                // 如果不是顶层节点，有父节点，然后添加到父节点的子节点中
                Menu parent = dtoMap.get(parentId);
                parent.addChild(node);
                parent.setLeaf(false);
            }
        }

        return result;
    }
}
