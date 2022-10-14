package com.timesheet.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "ess_user_master")
public class User {

	@Id
	Long empId;
	String password;
	String active;
	String manager;

	public User() {
		super();
	}

	public User(Long empId, String password, String active, String manager) {
		super();
		this.empId = empId;
		this.password = password;
		this.active = active;
		this.manager = manager;
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

	public String getManager() {
		return manager;
	}

	public void setManager(String manager) {
		this.manager = manager;
	}

	@Override
	public String toString() {
		return "User [empId=" + empId + ", password=" + password + ", active=" + active + ", manager=" + manager + "]";
	}

}
