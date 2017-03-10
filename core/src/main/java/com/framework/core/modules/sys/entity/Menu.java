package com.framework.core.modules.sys.entity;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


/**
 * <p>
 * 系统菜单
 * </p>
 *
 * @author Sun.Han
 * @since 2017-03-01
 */
@TableName("sys_menu")
public class Menu extends Model<Menu> {

    private static final long serialVersionUID = 1L;

	private Integer id;
    /**
     * 父ID
     */
	@TableField("parent_id")
	private Integer parentId;
    /**
     * 树ID
     */
	@TableField("parent_ids")
	private String parentIds;
    /**
     * 菜单名称
     */
	private String name;
    /**
     * 排序
     */
	private Integer sort;
    /**
     * 链接
     */
	private String href;
    /**
     * 图标
     */
	private String icon;
    /**
     * 是否显示
	1：显示
	0：隐藏
     */
	private Boolean show;
    /**
     * 权限标识
     */
	private String permission;
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
     * 删除标记
	 * 1：删除
	 * 0：未删除
     */
	@TableField("del_flag")
	private String delFlag;

	private transient String parentName;
	/**
	 * 是否是叶子节点
	 */
	private transient Boolean leaf = true;
	/**
	 * 子节点
	 */
	private transient List<Menu> children = new ArrayList<>();

	/**
	 * 添加子节点
	 *
	 * @param node 菜单节点
	 */
	public void addChild(Menu node) {
		this.children.add(node);
	}


	public List<Menu> getChildren() {
		return children;
	}

	public void setChildren(List<Menu> children) {
		this.children = children;
	}


	public Boolean getLeaf() {
		return leaf;
	}

	public void setLeaf(Boolean leaf) {
		this.leaf = leaf;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getParentId() {
		return parentId;
	}

	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}

	public String getParentIds() {
		return parentIds;
	}

	public void setParentIds(String parentIds) {
		this.parentIds = parentIds;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getSort() {
		return sort;
	}

	public void setSort(Integer sort) {
		this.sort = sort;
	}

	public String getHref() {
		return href;
	}

	public void setHref(String href) {
		this.href = href;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public Boolean getShow() {
		return show;
	}

	public void setShow(Boolean show) {
		this.show = show;
	}

	public String getPermission() {
		return permission;
	}

	public void setPermission(String permission) {
		this.permission = permission;
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

	public String getParentName() {
		return parentName;
	}

	public void setParentName(String parentName) {
		this.parentName = parentName;
	}

}
