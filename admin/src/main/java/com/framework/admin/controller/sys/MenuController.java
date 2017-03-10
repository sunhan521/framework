package com.framework.admin.controller.sys;

import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.framework.admin.controller.GenericController;
import com.framework.admin.security.model.AuthUser;
import com.framework.core.exception.BusinessException;
import com.framework.core.exception.NotFoundException;
import com.framework.core.message.ResponseMessage;
import com.framework.core.modules.sys.entity.Menu;
import com.framework.core.modules.sys.service.MenuService;
import com.framework.core.po.DataTablesPo;
import com.framework.core.po.JsTree;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import static com.framework.core.message.ResponseMessage.created;
import static com.framework.core.message.ResponseMessage.ok;

/**
 * <p>
 * 菜单 前端控制器
 * </p>
 *
 * @author SunHan
 * @since 2017-01-21
 */
@RestController
@RequestMapping("sys/menu")
public class MenuController extends GenericController<Menu> {

    @Resource
    private MenuService menuService;

    @Override
    protected MenuService getService() {
        return menuService;
    }

    /**
     * Gets menu nav.
     *
     * @return the menu nav
     */
    @PreAuthorize("isAuthenticated()")
    @GetMapping(value = "/nav")
    public List<Menu> getMenuNav() {
        AuthUser user = getCurrentUser();
        return menuService.getMenuNav(user.getId());
    }

    /**
     * Gets menu tree.
     *
     * @return the menu tree
     */
    @PreAuthorize("hasAuthority('sys:menu:view')")
    @GetMapping(value = "/tree")
    public List<Menu> getMenuTree() {
        AuthUser user = getCurrentUser();
        return menuService.getMenuTree(user.getId());
    }

    /**
     * Gets menu list.
     *
     * @return the menu list
     */
    @PreAuthorize("hasAuthority('sys:menu:view')")
    @GetMapping(value = "/list")
    public List<Menu> getMenuList() {
        AuthUser user = getCurrentUser();
        return menuService.getMenuList(user.getId());
    }

    /**
     * Gets menu list.
     *
     * @return the menu list
     */
    @PreAuthorize("hasAuthority('sys:menu:view')")
    @GetMapping(value = "/jstree")
    public List<JsTree> getJsTree(@RequestParam(value = "selectedId", required = false) Integer selectedId,
                                  @RequestParam(value = "disableId", required = false) Integer disableId) {
        AuthUser user = getCurrentUser();
        return menuService.getJsTree(user.getId(), selectedId, disableId);
    }

    /**
     * Gets menu list.
     *
     * @return the menu list
     */
    @PreAuthorize("hasAuthority('sys:menu:view')")
    @GetMapping(value = "/jstree/{roleId}")
    public List<JsTree> getJsTreeRoleId(@PathVariable(required = false) Integer roleId,@RequestParam(value = "selectedId", required = false) Integer selectedId,
                                  @RequestParam(value = "disableId", required = false) Integer disableId) {
        AuthUser user = getCurrentUser();
        return menuService.getJsTree(user.getId(), selectedId, disableId,roleId);
    }

    /**
     * 查询列表,并返回查询结果
     */
    @GetMapping(value = "treeGrid")
    public List<Menu> treeGrid(Menu menu) {
        return menuService.getMenuList(menu);
    }


    /**
     * 根据id（主键）查询数据
     *
     * @param id 主键
     * @return 请求结果
     * @throws NotFoundException 要查询的数据不存在
     */
    @GetMapping(value = "/{id}")
    public ResponseMessage info(@PathVariable("id") Integer id) {
        Menu po = menuService.getMenuById(id);
        if (po == null)
            throw new NotFoundException("data is not found!");

        return ok(po);
    }

    /**
     * 请求添加数据，请求必须以POST方式
     *
     * @param menu 请求添加的对象
     * @return 被添加数据的主键值
     * @throws javax.validation.ValidationException 验证数据格式错误
     */
    @PostMapping()
    @ResponseStatus(HttpStatus.CREATED)
    public ResponseMessage add(Menu menu) {
        if (menu.getParentId() == null) {
            menu.setParentId(0);
            menu.setParentIds(",0,");
            getService().insert(menu);
            return created(menu);
        }

        Menu parent = getService().selectById(menu.getParentId());
        if (parent != null) {
            menu.setParentIds(parent.getParentIds() + parent.getId() + ",");
            getService().insert(menu);
            return created(menu);
        }
        menu.setParentId(0);
        menu.setParentIds(",0,");
        getService().insert(menu);
        return created(menu);
    }


    /**
     * 根据主键修改数据
     *
     * @param id   要修改数据的主键值
     * @param menu 要修改的数据
     * @return 请求结果
     * @throws NotFoundException 要修改的数据不存在
     */
    @PutMapping(value = "/{id}")
    public ResponseMessage update(@PathVariable("id") Integer id, Menu menu) {
        Menu old = getService().selectById(id);
        assertFound(old, "data is not found!");
        menu.setId(id);
        getService().saveMenu(menu,old.getParentIds());
        return ok();
    }


    /**
     * 查询列表,并返回查询结果
     */
    @PostMapping(value = "page")
    public DataTablesPo<Menu> page(Map<String, Object> condition) {
        Page<Menu> param = getPage();
        param.setCondition(condition);
        Page<Menu> page = getService().selectPage(param);
        return getTablesData(page);
    }

    /**
     * 根据查询条件，查询数据数量
     *
     * @param t 查询条件
     * @return 请求结果
     */
    @GetMapping(value = "/total")
    public ResponseMessage total(Menu t) {
        EntityWrapper<Menu> wrapper = new EntityWrapper<>(t);
        // 获取条件查询
        return ok(getService().selectCount(wrapper));
    }

    /**
     * 请求删除指定id的数据，请求方式为DELETE，使用rest风格，如请求 /delete/1 ，将删除id为1的数据
     *
     * @param id 要删除的id标识
     * @return 删除结果
     * @throws NotFoundException 要删除的数据不存在
     */
    @DeleteMapping(value = "/{id}")
    public ResponseMessage delete(@PathVariable("id") Integer id) {
        Menu old = getService().selectById(id);
        assertFound(old, "data is not found!");
        getService().deleteById(id);
        return ok();
    }

    @PostMapping(value = "/batchDelete")
    public ResponseMessage batchDelete(String ids) {
        getService().deleteBatchIds(Arrays.asList(ids.split(",")));
        return ok();
    }

    /**
     * 批量修改数据.
     *
     * @param json 请求修改的数据 json格式
     * @return 被修改数据的条数
     * @throws BusinessException 请求的数据格式错误
     */
    @PutMapping()
    public ResponseMessage update(String json) {
        Boolean success;
        if (json.startsWith("[")) {
            success = getService().updateBatchById(JSON.parseArray(json, getPOType()));
        } else if (json.startsWith("{")) {
            success = getService().updateBatchById(Arrays.asList(JSON.parseObject(json, getPOType())));
        } else {
            throw new BusinessException("请求数据格式错误!");
        }
        return ok(success);
    }


}
