package com.timesheet.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.CreationTimestamp;

@Table(name = "timesheet_program_master")
@Entity
public class Program {
	
	@Id
//	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "PRG_CODE")
	Integer prgCode;
	@Column(name = "PRG_DESC")
	String prgDesc;
	@Column(name = "PRG_NAME")
	String prgName;
	@Column(name = "PRG_PRNT")
	String prgPrnt;
	@Column(name = "PRG_ORDER")
	Integer prgOrder;
	@Column(name = "CREATED_BY")
	String createdBy;
	@CreationTimestamp
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "CREATED_TIME")
	Date createdTime;
	@Column(name = "MODIFIED_BY")
	String modifiedBy;
	@CreationTimestamp
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "MODIFIED_TIME")
	Date modifiedTime;

	public Program() {
		super();
	}

	public Program(Integer prgCode, String prgDesc, String prgName, String prgPrnt, Integer prgOrder, String createdBy,
			Date createdTime, String modifiedBy, Date modifiedTime) {
		super();
		this.prgCode = prgCode;
		this.prgDesc = prgDesc;
		this.prgName = prgName;
		this.prgPrnt = prgPrnt;
		this.prgOrder = prgOrder;
		this.createdBy = createdBy;
		this.createdTime = createdTime;
		this.modifiedBy = modifiedBy;
		this.modifiedTime = modifiedTime;
	} 

	public Integer getPrgCode() {
		return prgCode;
	}

	public void setPrgCode(Integer prgCode) {
		this.prgCode = prgCode;
	}

	public String getPrgDesc() {
		return prgDesc;
	}

	public void setPrgDesc(String prgDesc) {
		this.prgDesc = prgDesc;
	}

	public String getPrgName() {
		return prgName;
	}

	public void setPrgName(String prgName) {
		this.prgName = prgName;
	}

	public String getPrgPrnt() {
		return prgPrnt;
	}

	public void setPrgPrnt(String prgPrnt) {
		this.prgPrnt = prgPrnt;
	}

	public Integer getPrgOrder() {
		return prgOrder;
	}

	public void setPrgOrder(Integer prgOrder) {
		this.prgOrder = prgOrder;
	}

	public String getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}

	public Date getCreatedTime() {
		return createdTime;
	}

	public void setCreatedTime(Date createdTime) {
		this.createdTime = createdTime;
	}

	public String getModifiedBy() {
		return modifiedBy;
	}

	public void setModifiedBy(String modifiedBy) {
		this.modifiedBy = modifiedBy;
	}

	public Date getModifiedTime() {
		return modifiedTime;
	}

	public void setModifiedTime(Date modifiedTime) {
		this.modifiedTime = modifiedTime;
	}

	@Override
	public String toString() {
		return "Program [prgCode=" + prgCode + ", prgDesc=" + prgDesc + ", prgName=" + prgName + ", prgPrnt=" + prgPrnt
				+ ", prgOrder=" + prgOrder + ", createdBy=" + createdBy + ", createdTime=" + createdTime
				+ ", modifiedBy=" + modifiedBy + ", modifiedTime=" + modifiedTime + "]";
	}

}
