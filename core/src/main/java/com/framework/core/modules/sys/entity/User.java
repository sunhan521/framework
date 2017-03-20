package com.framework.core.modules.sys.entity;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.FieldStrategy;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


/**
 * <p>
 * 系统用户
 * </p>
 *
 * @author Sun.Han
 * @since 2017-02-22
 */
@TableName("sys_user")
public class User extends Model<User> {

    private static final long serialVersionUID = 1L;
    /**
     * 超级管理用户ID
     */
    public static final Integer ADMIN_USER_ID = 1;

    private Integer id;
    /**
     * 登录名
     */
    @TableField("login_name")
    private String loginName;
    /**
     * 密码,Null 的时候不更新密码
     */
    @TableField(validate = FieldStrategy.NOT_NULL)
    private String password;
    /**
     * 姓名
     */
    private String name;
    /**
     * 邮件
     */
    private String email;
    /**
     * 电话
     */
    private String phone;
    /**
     * 手机
     */
    private String mobile;
    /**
     * 是否可用 1：可用 0：停用
     */
    private Boolean enabled;

    /**
     * 备注
     */
    private String remarks;
    /**
     * 创建时间
     */
    @TableField("create_date")
    private Date createDate;
    /**
     * 更新时间
     */
    @TableField("update_date")
    private Date updateDate;
    /**
     * 删除标记 1：删除 0：未删除
     */
    @TableField("del_flag")
    private String delFlag;

    /**
     * 角色列表
     */
    @TableField(exist = false)
    private List<Role> roles = new ArrayList<>();

    @TableField(exist = false)
    private String roleIds;
    /**
     * 菜单列表
     */
    @TableField(exist = false)
    private List<Menu> menus = new ArrayList<>();


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public Date getUpdateDate() {
        return updateDate;
    }

    public void setUpdateDate(Date updateDate) {
        this.updateDate = updateDate;
    }

    public String getDelFlag() {
        return delFlag;
    }

    public void setDelFlag(String delFlag) {
        this.delFlag = delFlag;
    }

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

    public Boolean isEnabled() {
        return enabled;
    }

    public void setEnabled(Boolean enabled) {
        this.enabled = enabled;
    }

    public List<Role> getRoles() {
        return roles;
    }

    public void setRoles(List<Role> roles) {
        this.roles = roles;
    }

    public List<Menu> getMenus() {
        return menus;
    }

    public void setMenus(List<Menu> menus) {
        this.menus = menus;
    }

    public String getRoleIds() {
        return roleIds;
    }

    public void setRoleIds(String roleIds) {
        this.roleIds = roleIds;
    }

    public User() {
    }

    public User(String loginName) {
        this.loginName = loginName;
        this.enabled = true;
    }

}
