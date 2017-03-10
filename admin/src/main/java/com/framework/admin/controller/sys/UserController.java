package com.framework.admin.controller.sys;

import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.framework.admin.controller.GenericController;
import com.framework.core.exception.BusinessException;
import com.framework.core.exception.NotFoundException;
import com.framework.core.message.ResponseMessage;
import com.framework.core.modules.sys.entity.User;
import com.framework.core.modules.sys.service.UserRoleService;
import com.framework.core.modules.sys.service.UserService;
import com.framework.core.po.DataTablesPo;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import static com.framework.core.message.ResponseMessage.created;
import static com.framework.core.message.ResponseMessage.ok;

/**
 * <p>
 * 前端控制器
 * </p>
 *
 * @author SunHan
 * @since 2017-01-21
 */
@RestController
@RequestMapping("/sys/user")
public class UserController extends GenericController<User> {
    @Autowired
    private UserService userService;

    @Autowired
    private UserRoleService userRoleService;

    @Override
    protected UserService getService() {
        return userService;
    }


    /**
     * 查询列表,并返回查询结果
     */
    @PostMapping(value = "page")
    @PreAuthorize("hasAuthority('sys:user:view')")
    public DataTablesPo<User> page(Map<String, Object> condition) {
        Page<User> param = getPage();
        param.setCondition(condition);
        Page<User> page = getService().selectPage(param);
        return getTablesData(page);
    }

    /**
     * 根据id（主键）查询数据
     *
     * @param id 主键
     * @return 请求结果
     * @throws NotFoundException 要查询的数据不存在
     */
    @GetMapping(value = "/{id}")
    @PreAuthorize("hasAuthority('sys:user:view')")
    public ResponseMessage info(@PathVariable("id") Integer id) {
        User po = getService().selectById(id);
        if (po == null)
            throw new NotFoundException("data is not found!");
        List<String> roleIds = userRoleService.getRoleIdsByUserId(id);
        po.setRoleIds(String.join(",", roleIds));
        return ok(po);
    }


    /**
     * 根据查询条件，查询数据数量
     *
     * @param t 查询条件
     * @return 请求结果
     */
    @GetMapping(value = "/total")
    @PreAuthorize("hasAuthority('sys:user:view')")
    public ResponseMessage total(User t) {
        EntityWrapper<User> wrapper = new EntityWrapper<>(t);
        // 获取条件查询
        return ok(getService().selectCount(wrapper));
    }

    /**
     * 请求添加数据，请求必须以POST方式
     *
     * @param object 请求添加的对象
     * @return 被添加数据的主键值
     * @throws javax.validation.ValidationException 验证数据格式错误
     */
    @PostMapping()
    @ResponseStatus(HttpStatus.CREATED)
    @PreAuthorize("hasAuthority('sys:user:edit')")
    public ResponseMessage add(User object) {
        Md5PasswordEncoder passwordEncoder = new Md5PasswordEncoder();
        object.setPassword(passwordEncoder.encodePassword(object.getPassword(),""));
        getService().insert(object);
        getService().editRole(object);
        return created(object);
    }

    /**
     * 请求删除指定id的数据，请求方式为DELETE，使用rest风格，如请求 /delete/1 ，将删除id为1的数据
     *
     * @param id 要删除的id标识
     * @return 删除结果
     * @throws NotFoundException 要删除的数据不存在
     */
    @DeleteMapping(value = "/{id}")
    @PreAuthorize("hasAuthority('sys:user:edit')")
    public ResponseMessage delete(@PathVariable("id") Integer id) {
        User old = getService().selectById(id);
        assertFound(old, "data is not found!");
        getService().deleteById(id);
        return ok();
    }

    @PostMapping(value = "/batchDelete")
    @PreAuthorize("hasAuthority('sys:user:edit')")
    public ResponseMessage batchDelete(String ids) {
        getService().deleteBatchIds(Arrays.asList(ids.split(",")));
        return ok();
    }


    /**
     * 根据主键修改数据
     *
     * @param id     要修改数据的主键值
     * @param object 要修改的数据
     * @return 请求结果
     * @throws NotFoundException 要修改的数据不存在
     */
    @PutMapping(value = "/{id}")
    @PreAuthorize("hasAuthority('sys:user:edit')")
    public ResponseMessage update(@PathVariable("id") Integer id, User object) {
        User old = getService().selectById(id);
        assertFound(old, "data is not found!");
        if (!StringUtils.isEmpty(object.getPassword())){
            Md5PasswordEncoder passwordEncoder = new Md5PasswordEncoder();
            object.setPassword(passwordEncoder.encodePassword(object.getPassword(),""));
        }
        Boolean b = getService().updateById(object);
        getService().editRole(object);
        return ok(b);
    }

    /**
     * 批量修改数据.
     *
     * @param json 请求修改的数据 json格式
     * @return 被修改数据的条数
     * @throws BusinessException 请求的数据格式错误
     */
    @PutMapping()
    @PreAuthorize("hasAuthority('sys:user:edit')")
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
