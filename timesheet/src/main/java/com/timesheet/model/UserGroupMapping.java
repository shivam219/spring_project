package com.timesheet.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "ess_user_group_mapping")
public class UserGroupMapping {

	@Id
	@GeneratedValue(strategy = GenerationType.TABLE)
	Integer id;
	Long empId;
	int ugrpCode;
	String createdBy;
	String createdTime;
	String modifiedBy;
	String modifiedTime;

	public UserGroupMapping() {
		super();
	}

	public UserGroupMapping(Integer id, Long empId, int ugrpCode, String createdBy, String createdTime,
			String modifiedBy, String modifiedTime) {
		super();
		this.id = id;
		this.empId = empId;
		this.ugrpCode = ugrpCode;
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

	public Long getEmpId() {
		return empId;
	}

	public void setEmpId(Long empId) {
		this.empId = empId;
	}

	public int getUgrpCode() {
		return ugrpCode;
	}

	public void setUgrpCode(int ugrpCode) {
		this.ugrpCode = ugrpCode;
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
		return "UserGroupMapping [id=" + id + ", empId=" + empId + ", ugrpCode=" + ugrpCode + ", createdBy=" + createdBy
				+ ", createdTime=" + createdTime + ", modifiedBy=" + modifiedBy + ", modifiedTime=" + modifiedTime
				+ "]";
	}

}
