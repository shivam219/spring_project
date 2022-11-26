package com.timesheet.model;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "timesheet_user_group_master")
public class UserGroup {

	@Id
	@GeneratedValue(strategy = GenerationType.TABLE)
	@Column(name = "UGRP_CODE")
	int ugrpCode;
	@Column(name = "UGRP_DESC")
	String ugrpDesc;
	@Column(name = "CREATED_BY")
	String createdBy;
	@Column(name = "CREATED_TIME")
	String createdTime;
	@Column(name = "MODIFIED_BY")
	String modifiedBy;
	@Column(name = "MODIFIED_TIME")
	String modifiedTime;

	public UserGroup() {
		super();
		// TODO Auto-generated constructor stub
	}

	public UserGroup(int ugrpCode, String ugrpDesc, String createdBy, String createdTime, String modifiedBy,
			String modifiedTime) {
		super();
		this.ugrpCode = ugrpCode;
		this.ugrpDesc = ugrpDesc;
		this.createdBy = createdBy;
		this.createdTime = createdTime;
		this.modifiedBy = modifiedBy;
		this.modifiedTime = modifiedTime;
	}

	public int getUgrpCode() {
		return ugrpCode;
	}

	public void setUgrpCode(int ugrpCode) {
		this.ugrpCode = ugrpCode;
	}

	public String getUgrpDesc() {
		return ugrpDesc;
	}

	public void setUgrpDesc(String ugrpDesc) {
		this.ugrpDesc = ugrpDesc;
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
		return "UserGroup [ugrpCode=" + ugrpCode + ", ugrpDesc=" + ugrpDesc + ", createdBy=" + createdBy
				+ ", createdTime=" + createdTime + ", modifiedBy=" + modifiedBy + ", modifiedTime=" + modifiedTime
				+ "]";
	}

//	
//	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
//	@JoinTable(name = "ess_user_group_mapping", joinColumns = @JoinColumn(name = "ugrp_codee"), inverseJoinColumns = @JoinColumn(name = "emp_idd"))
//	List<User> user;

}
