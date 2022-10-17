package com.timesheet.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "ess_user_master")
public class User {

	@Id
	Long empId;
	String password;
	String active;
	String managerId;

	public User() {
		super();
	}

	public User(Long empId, String password, String active, String managerId) {
		super();
		this.empId = empId;
		this.password = password;
		this.active = active;
		this.managerId = managerId;
	}

	public Long getEmpId() {
		return empId;
	}

	public void setEmpId(Long empId) {
		this.empId = empId;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getActive() {
		return active;
	}

	public void setActive(String active) {
		this.active = active;
	}

	public String getManagerId() {
		return managerId;
	}

	public void setManagerId(String managerId) {
		this.managerId = managerId;
	}

	@Override
	public String toString() {
		return "User [empId=" + empId + ", password=" + password + ", active=" + active + ", managerId=" + managerId
				+ "]";
	}

}
