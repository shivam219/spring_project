package com.timesheet.model;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonBackReference;

@Entity
@Table(name = "timesheet_user_master")
public class User {

	@Id
	Long empId;

	@OneToOne(fetch = FetchType.EAGER)
	@PrimaryKeyJoinColumn(name = "empId")
	Employee employee;

	String password;
	String encryptedPassword;

	int active;
	String managerId;
	@Column(name = "leave_reporting_manager")
	String leaveReportingManager;
	@Column(name = "leave_manager_id")
	String leaveManager;

//	@Transient//s stop create instat
//	@OneToMany(mappedBy = "user")//it will create emp_id column in project table

//	@JsonBackReference
//	@JsonBackReference(value = "user-project")
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "timesheet_user_project_mapping", joinColumns = @JoinColumn(name = "emp_id"), inverseJoinColumns = @JoinColumn(name = "project_id"))
	List<Project> project;

	@JsonBackReference()
	@OneToMany(mappedBy = "user", fetch = FetchType.LAZY)
	List<Customer> customer;

	private String username;

	private String roles = "";

	private String permissions = "";

	public User() {
		super();
	}

	public Long getEmpId() {
		return empId;
	}

	public void setEmpId(Long empId) {
		this.empId = empId;
	}

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEncryptedPassword() {
		return encryptedPassword;
	}

	public void setEncryptedPassword(String encryptedPassword) {
		this.encryptedPassword = encryptedPassword;
	}

	public int getActive() {
		return active;
	}

	public void setActive(int active) {
		this.active = active;
	}

	public String getManagerId() {
		return managerId;
	}

	public void setManagerId(String managerId) {
		this.managerId = managerId;
	}

	public String getLeaveReportingManager() {
		return leaveReportingManager;
	}

	public void setLeaveReportingManager(String leaveReportingManager) {
		this.leaveReportingManager = leaveReportingManager;
	}

	public String getLeaveManager() {
		return leaveManager;
	}

	public void setLeaveManager(String leaveManager) {
		this.leaveManager = leaveManager;
	}

	public List<Project> getProject() {
		return project;
	}

	public void setProject(List<Project> project) {
		this.project = project;
	}

	public List<Customer> getCustomer() {
		return customer;
	}

	public void setCustomer(List<Customer> customer) {
		this.customer = customer;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getRoles() {
		return roles;
	}

	public void setRoles(String roles) {
		this.roles = roles;
	}

	public String getPermissions() {
		return permissions;
	}

	public void setPermissions(String permissions) {
		this.permissions = permissions;
	}

	public List<String> getRoleList() {
//		one of them are false will not go to next
		if (this.roles!=null && this.roles.length() > 0) {
			return Arrays.asList(this.roles.split(","));
		}
		return new ArrayList<>();
	}

	public List<String> getPermissionList() {
		if (this.permissions!=null && this.permissions.length() > 0) {
			return Arrays.asList(this.permissions.split(","));
		}
		return new ArrayList<>();
	}

	@Override
	public String toString() {
		return "User [empId=" + empId + ", password=" + password + ", encryptedPassword=" + encryptedPassword
				+ ", active=" + active + ", managerId=" + managerId + ", leaveReportingManager=" + leaveReportingManager
				+ ", leaveManager=" + leaveManager + ", username=" + username + ", roles=" + roles + ", permissions="
				+ permissions + "]";
	}

}
