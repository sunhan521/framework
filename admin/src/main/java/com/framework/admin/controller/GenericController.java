package com.framework.admin.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.IService;
import com.framework.admin.editor.DateEditor;
import com.framework.admin.editor.StringEditor;
import com.framework.admin.utils.Const;
import com.framework.core.exception.NotFoundException;
import com.framework.core.po.DataTablesPo;
import com.framework.core.utils.ClassUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;


/**
 * 通用控制器,此控制器实现了通用的增删改查功能
 * 需要提供一个实现了{@link IService}接口的实现类
 *
 * @author sunhan
 * @since 2017年02月15日
 */
public abstract class GenericController<T> {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    protected HttpServletRequest request;

    @Autowired
    protected HttpSession session;

    @Autowired
    protected ServletContext application;

    /**
     * 获取此Controller需要的服务类,由子类实现
     *
     * @return 通用服务类
     */
    protected abstract IService<T> getService();

    /**
     * 获取PO的类型
     *
     * @return PO类型
     */
    protected final Class<T> getPOType() {
        return (Class<T>) ClassUtils.getGenericType(this.getClass(), 0);
    }


    /**
     * 判断对象是否为空,如果为空将抛出 {@link NotFoundException}
     *
     * @param obj 要判断的对象
     * @param msg 为null时异常消息
     */
    public void assertFound(Object obj, String msg) {
        if (obj == null) throw new NotFoundException(msg);
    }

    public HttpServletRequest getRequest() {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
        return request;
    }

    /**
     * <p>
     * 转换为 bootstrap-table 需要的分页格式 JSON
     * </p>
     *
     * @param page 分页对象
     * @return
     */
    protected DataTablesPo<T> getTablesData(Page<T> page) {
        DataTablesPo<T> bo = new DataTablesPo<>();
        bo.setData(page.getRecords());
        bo.setDraw(request.getParameter("draw"));
        bo.setRecordsTotal(page.getTotal());
        bo.setRecordsFiltered(page.getTotal());
        return bo;
    }


    /**
     * <p>
     * 转换为 bootstrap-table 需要的分页格式 JSON
     * </p>
     *
     * @param data 分页对象
     * @return
     */
    protected DataTablesPo<T> getTablesDataUnPage(List<T> data) {
        DataTablesPo<T> bo = new DataTablesPo<>();
        bo.setData(data);
        bo.setDraw(request.getParameter("draw"));
        bo.setRecordsTotal(data.size());
        bo.setRecordsFiltered(data.size());
        return bo;
    }

    /**
     * <p>
     * 获取分页对象
     * </p>
     *
     * @return
     */
    protected <T> Page<T> getPage() {
        int start = 0;
        int length = 10;
        if (request.getParameter(Const.LENGTH) != null) {
            start = Integer.parseInt(request.getParameter(Const.START));
        }
        if (request.getParameter(Const.LENGTH) != null) {
            length = Integer.parseInt(request.getParameter(Const.LENGTH));
        }
        Page<T> page = new Page<>(start / length + 1, length);
        page.setOrderByField("id");
        page.setAsc(false);
        return page;
    }
    protected <T> EntityWrapper<T> getEntityWrapper() {
        EntityWrapper<T> ew = new EntityWrapper<>();
        ew.where("del_flag={0}", Const.DEL_FLAG_NORMAL);
        return ew;
    }

    /**
     * 获取当前登录者对象
     *
     * @param <U> the type parameter
     * @return the current user
     */
    @SuppressWarnings("unchecked")
    public static <U extends UserDetails> U getCurrentUser() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        return (U) authentication.getPrincipal();
    }


    /**
     * 初始化数据绑定
     * 1. 将所有传递进来的String进行HTML编码，防止XSS攻击
     * 2. 将字段中Date类型转换为String类型
     *
     * @param binder the binder
     */
    @InitBinder
    protected void initBinder(WebDataBinder binder) {
        // String类型转换，将所有传递进来的String进行HTML编码，防止XSS攻击
        binder.registerCustomEditor(String.class, new StringEditor());
        // Date 类型转换
        binder.registerCustomEditor(Date.class, new DateEditor());
    }
}
