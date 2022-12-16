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

@Entity
@Table(name = "timesheet_program_groupwise")
public class ProgramGroup {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	Integer id;
	@Column(name = "UGRP_CODE")
	Integer ugrpCode;
	@Column(name = "PRG_CODE")
	Integer prgCode;
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

	public ProgramGroup() {
		super();
	}

	public ProgramGroup(Integer id, Integer ugrpCode, Integer prgCode, String createdBy, Date createdTime,
			String modifiedBy, Date modifiedTime) {
		super();
		this.id = id;
		this.ugrpCode = ugrpCode;
		this.prgCode = prgCode;
		this.createdBy = createdBy;
		this.createdTime = createdTime;
		this.modifiedBy = modifiedBy;
		this.modifiedTime = modifiedTime;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUgrpCode() {
		return ugrpCode;
	}

	public void setUgrpCode(Integer ugrpCode) {
		this.ugrpCode = ugrpCode;
	}

	public Integer getPrgCode() {
		return prgCode;
	}

	public void setPrgCode(Integer prgCode) {
		this.prgCode = prgCode;
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
		return "ProgramGroup [id=" + id + ", ugrpCode=" + ugrpCode + ", prgCode=" + prgCode + ", createdBy=" + createdBy
				+ ", createdTime=" + createdTime + ", modifiedBy=" + modifiedBy + ", modifiedTime=" + modifiedTime
				+ "]";
	}

}
