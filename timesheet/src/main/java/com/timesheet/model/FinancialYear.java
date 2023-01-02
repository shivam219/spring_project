package com.timesheet.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.LastModifiedBy;

@Entity
@Table(name = "timesheet_financial_year")
public class FinancialYear {

	@Id
	private int yearCode;

	private String yearDesc;

	@CreationTimestamp
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "create_time", updatable = false)
	private Date createTime;

	@CreatedBy
	@Column(name = "created_by")
	String createdBy;

	@UpdateTimestamp
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "modify_time")
	private Date modifyTime;

	@LastModifiedBy
	@Column(name = "modified_by")
	String modifiedBy;

	public FinancialYear() {
		super();

	}

	public FinancialYear(int yearCode, String yearDesc, Date createTime, String createdBy, Date modifyTime,
			String modifiedBy) {
		super();
		this.yearCode = yearCode;
		this.yearDesc = yearDesc;
		this.createTime = createTime;
		this.createdBy = createdBy;
		this.modifyTime = modifyTime;
		this.modifiedBy = modifiedBy;
	}

	public int getYearCode() {
		return yearCode;
	}

	public void setYearCode(int yearCode) {
		this.yearCode = yearCode;
	}

	public String getYearDesc() {
		return yearDesc;
	}

	public void setYearDesc(String yearDesc) {
		this.yearDesc = yearDesc;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}

	public Date getModifyTime() {
		return modifyTime;
	}

	public void setModifyTime(Date modifyTime) {
		this.modifyTime = modifyTime;
	}

	public String getModifiedBy() {
		return modifiedBy;
	}

	public void setModifiedBy(String modifiedBy) {
		this.modifiedBy = modifiedBy;
	}

	@Override
	public String toString() {
		return "FinancialYear [yearCode=" + yearCode + ", yearDesc=" + yearDesc + ", createTime=" + createTime
				+ ", createdBy=" + createdBy + ", modifyTime=" + modifyTime + ", modifiedBy=" + modifiedBy + "]";
	}

}
