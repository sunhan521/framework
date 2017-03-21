package com.framework.core.modules.sys.entity;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;

import java.io.Serializable;
import java.util.Date;

/**
 * <p>
 * 系统错误信息
 * </p>
 *
 * @author Sun.Han
 * @since 2017-03-21
 */
@TableName("sys_error_message")
public class ErrorMessage extends Model<ErrorMessage> {

    private static final long serialVersionUID = 1L;

	@TableId(value="id", type= IdType.AUTO)
	private Integer id;
    /**
     * 创建时间
     */
	@TableField("create_date")
	private Date createDate;
    /**
     * 异常Class
     */
	@TableField("class_name")
	private String className;
    /**
     * 异常Method
     */
	@TableField("method_name")
	private String methodName;
    /**
     * 行号
     */
	@TableField("line_number")
	private Integer lineNumber;
    /**
     * 异常消息
     */
	private String message;

	/**
	 * 异常堆栈消息
	 */
	private String stackTrace;
    /**
     * 处理状态
     */
	private Integer status;


	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public String getMethodName() {
		return methodName;
	}

	public void setMethodName(String methodName) {
		this.methodName = methodName;
	}

	public Integer getLineNumber() {
		return lineNumber;
	}

	public void setLineNumber(Integer lineNumber) {
		this.lineNumber = lineNumber;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getStackTrace() {
		return stackTrace;
	}

	public void setStackTrace(String stackTrace) {
		this.stackTrace = stackTrace;
	}

	@Override
	protected Serializable pkVal() {
		return this.id;
	}

}
