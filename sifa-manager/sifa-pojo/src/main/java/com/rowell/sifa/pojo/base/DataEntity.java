package com.rowell.sifa.pojo.base;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import org.hibernate.validator.constraints.Length;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.rowell.common.utils.IdGen;
import com.rowell.common.utils.StringUtils;
import com.rowell.sifa.pojo.sys.SysAccount;

public abstract class DataEntity<T> extends BaseEntity<T> implements Serializable {
	private static final long serialVersionUID = 1L;

	protected String remarks; // 备注
	protected String createrCnName;//
	/** 创建时间 */
	private Date created;

	/** 创建人 */
	private String creater;

	/** 更新时间 */
	private Date updated;

	/** 更新人 */
	private String updater;

	/** 删除标识 */
	protected Integer delFlag; // 删除标记（0：正常；1：删除；2：审核）

	protected String orderStr;

	protected String sort;// 排序的方式

	protected String order;// 排序的字段

	protected List<String> ids;

	protected Date searchStartDate;

	protected Date searchEndDate;

	public DataEntity() {
		super();
		this.delFlag = DEL_FLAG_NORMAL;
	}

	public DataEntity(String id) {
		super(id);
	}

	/**
	 * 插入之前执行方法，需要手动调用
	 */
	@Override
	public void preInsert() {
		// 不限制ID为UUID，调用setIsNewRecord()使用自定义ID
		if (!this.isNew) {
			setId(IdGen.uuid());
		}
		SysAccount user = getCurrentSysUser();
		if (user != null && StringUtils.isNotBlank(user.getId())) {
			this.creater = user.getId();
			this.updater = user.getId();
		}
		this.updated = new Date();
		this.created = this.updated;
	}

	/**
	 * 更新之前执行方法，需要手动调用
	 */
	@Override
	public void preUpdate() {
		SysAccount user = getCurrentSysUser();
		if (user != null && StringUtils.isNotBlank(user.getId())) {
			this.updater = user.getId();
		}
		this.updated = new Date();
	}

	@Length(max = 4000)
	@JsonIgnore
	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	@JsonIgnore
	public Integer getDelFlag() {
		return delFlag;
	}

	public void setDelFlag(Integer delFlag) {
		this.delFlag = delFlag;
	}

	@JsonIgnore
	public String getOrderStr() {
		if (!StringUtils.isBlank(sort) && !StringUtils.isBlank(order)) {
			return StringUtils.splitByUpperCase(sort, true) + " " + order;
		}
		return orderStr;
	}

	public void setOrderStr(String orderStr) {
		this.orderStr = orderStr;
	}

	public String getCreaterCnName() {
		return createrCnName;
	}

	public void setCreaterCnName(String createrCnName) {
		this.createrCnName = createrCnName;
	}

	@JsonIgnore
	public List<String> getIds() {
		return ids;
	}

	public void setIds(List<String> ids) {
		this.ids = ids;
	}

	@JsonIgnore
	public String getSort() {
		return sort;
	}

	public void setSort(String sort) {
		this.sort = sort;
	}

	@JsonIgnore
	public String getOrder() {
		return order;
	}

	public void setOrder(String order) {
		this.order = order;
	}

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
	public Date getCreated() {
		return created;
	}

	public void setCreated(Date created) {
		this.created = created;
	}

	public String getCreater() {
		return creater;
	}

	public void setCreater(String creater) {
		this.creater = creater;
	}

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
	public Date getUpdated() {
		return updated;
	}

	public void setUpdated(Date updated) {
		this.updated = updated;
	}

	public String getUpdater() {
		return updater;
	}

	public void setUpdater(String updater) {
		this.updater = updater;
	}

	@JsonIgnore
	public Date getSearchStartDate() {
		return searchStartDate;
	}

	public void setSearchStartDate(Date searchStartDate) {
		this.searchStartDate = searchStartDate;
	}

	@JsonIgnore
	public Date getSearchEndDate() {
		return searchEndDate;
	}

	public void setSearchEndDate(Date searchEndDate) {
		this.searchEndDate = searchEndDate;
	}

}
