package com.framework.core.modules.sys.entity;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;

import java.io.Serializable;


/**
 * <p>
 * 用户角色
 * </p>
 *
 * @author Sun.Han
 * @since 2017-02-22
 */
@TableName("sys_user_role")
public class UserRole extends Model<UserRole> {

	private static final long serialVersionUID = 1L;

	private Integer id;

	/**
	 * 用户ID
	 */
	@TableField("user_id")
	private Integer userId;
	/**
	 * 角色ID
	 */
	@TableField("role_id")
	private Integer roleId;


	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}

	@Override
	protected Serializable pkVal() {
		return this.userId;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
}
