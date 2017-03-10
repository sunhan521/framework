package com.framework.core.modules.sys.entity;

import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableName;
import com.framework.core.GenericPo;

import java.math.BigDecimal;


/**
 * <p>
 * 字典表
 * </p>
 *
 * @author SunHan
 * @since 2017-01-21
 */
@TableName("sys_dict")
public class Dict extends GenericPo<Dict> {

    private static final long serialVersionUID = 1L;

    /**
     * 数据值
     */
	private Integer value;
    /**
     * 标签名
     */
	private String label;
    /**
     * 类型
     */
	private String type;
    /**
     * 描述
     */
	private String description;
    /**
     * 排序（升序）
     */
	private BigDecimal sort;
    /**
     * 删除标记
     */
	@TableField("del_flag")
	private String delFlag;

	public Integer getValue() {
		return value;
	}

	public void setValue(Integer value) {
		this.value = value;
	}

	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public BigDecimal getSort() {
		return sort;
	}

	public void setSort(BigDecimal sort) {
		this.sort = sort;
	}

	public String getDelFlag() {
		return delFlag;
	}

	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}

}
