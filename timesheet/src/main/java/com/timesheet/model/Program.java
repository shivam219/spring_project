package com.timesheet.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "ess_program_master")
@Entity
public class Program {
	@Id
	@GeneratedValue(strategy = GenerationType.TABLE)
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
	@Column(name = "CREATED_TIME")
	String createdTime;
	@Column(name = "MODIFIED_BY")
	String modifiedBy;
	@Column(name = "MODIFIED_TIME")
	String modifiedTime;

	public Program() {
		super();
	}

	public Program(Integer prgCode, String prgDesc, String prgName, String prgPrnt, Integer prgOrder, String createdBy,
			String createdTime, String modifiedBy, String modifiedTime) {
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

	public String getCreatedTime() {
		return createdTime;
	}

	public void setCreatedTime(String createdTime) {
		this.createdTime = createdTime;
	}

	public String getModifiedBy() {
		return modifiedBy;
	}

	public void setModifiedBy(String modifiedBy) {
		this.modifiedBy = modifiedBy;
	}

	public String getModifiedTime() {
		return modifiedTime;
	}

	public void setModifiedTime(String modifiedTime) {
		this.modifiedTime = modifiedTime;
	}

	@Override
	public String toString() {
		return "Program [prgCode=" + prgCode + ", prgDesc=" + prgDesc + ", prgName=" + prgName + ", prgPrnt=" + prgPrnt
				+ ", prgOrder=" + prgOrder + ", createdBy=" + createdBy + ", createdTime=" + createdTime
				+ ", modifiedBy=" + modifiedBy + ", modifiedTime=" + modifiedTime + "]";
	}

}
