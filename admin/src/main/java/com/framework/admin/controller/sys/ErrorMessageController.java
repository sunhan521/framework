package com.framework.admin.controller.sys;

import com.alibaba.fastjson.JSON;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.framework.admin.controller.GenericController;
import com.framework.core.exception.BusinessException;
import com.framework.core.exception.NotFoundException;
import com.framework.core.message.ResponseMessage;
import com.framework.core.modules.sys.entity.ErrorMessage;
import com.framework.core.modules.sys.service.ErrorMessageService;
import com.framework.core.po.DataTablesPo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Map;

import static com.framework.core.message.ResponseMessage.created;
import static com.framework.core.message.ResponseMessage.ok;

/**
 * <p>
 * 字典表 前端控制器
 * </p>
 *
 * @author SunHan
 * @since 2017-01-21
 */
@RestController
@RequestMapping("/sys/errorMessage")
public class ErrorMessageController extends GenericController<ErrorMessage> {

    private EntityWrapper<ErrorMessage> ew = new EntityWrapper<>();


    @Autowired
    private ErrorMessageService errorMessageService;
    @Override
    protected ErrorMessageService getService() {
        return errorMessageService;
    }

    /**
     * 查询列表,并返回查询结果
     */
    @PostMapping(value = "page")
    @PreAuthorize("hasAuthority('sys:error:view')")
    public DataTablesPo<ErrorMessage> page(Map<String, Object> condition) {
        Page<ErrorMessage> param = getPage();
        param.setCondition(condition);
        Page<ErrorMessage> page = getService().selectPage(param);
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
    @PreAuthorize("hasAuthority('sys:error:view')")
    public ResponseMessage info(@PathVariable("id") Integer id) {
        ErrorMessage po = getService().selectById(id);
        if (po == null)
            throw new NotFoundException("data is not found!");
        return ok(po);
    }


    /**
     * 根据查询条件，查询数据数量
     *
     * @param t 查询条件
     * @return 请求结果
     */
    @GetMapping(value = "/total")
    @PreAuthorize("hasAuthority('sys:error:view')")
    public ResponseMessage total(ErrorMessage t) {
        EntityWrapper<ErrorMessage> wrapper = new EntityWrapper<>(t);
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
    @PreAuthorize("hasAuthority('sys:error:edit')")
    public ResponseMessage add(ErrorMessage object) {
        getService().insert(object);
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
    @PreAuthorize("hasAuthority('sys:error:edit')")
    public ResponseMessage delete(@PathVariable("id") Integer id) {
        ErrorMessage old = getService().selectById(id);
        assertFound(old, "data is not found!");
        getService().deleteById(id);
        return ok();
    }

    @PostMapping(value = "/batchDelete")
    @PreAuthorize("hasAuthority('sys:error:edit')")
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
    @PreAuthorize("hasAuthority('sys:error:edit')")
    public ResponseMessage update(@PathVariable("id") Integer id, ErrorMessage object) {
        ErrorMessage old = getService().selectById(id);
        assertFound(old, "data is not found!");
        object.setId(id);
        Boolean b = getService().updateById(object);
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
    @PreAuthorize("hasAuthority('sys:error:edit')")
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
