package com.timesheet.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;

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
	String leaveReportingManger;
	String leaveManager;

//	@Transient//s stop create instat
//	@OneToMany(mappedBy = "user")//it will create emp_id column in project table

//	@JsonBackReference
//	@JsonBackReference(value = "user-project")
	@ManyToMany
	@JoinTable(name = "timesheet_user_project_mapping", joinColumns = @JoinColumn(name = "emp_id"), inverseJoinColumns = @JoinColumn(name = "project_id"))
	List<Project> project;

	@JsonBackReference()
	@OneToMany(mappedBy = "user")
	List<Customer> customer;

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

	public String getLeaveReportingManger() {
		return leaveReportingManger;
	}

	public void setLeaveReportingManger(String leaveReportingManger) {
		this.leaveReportingManger = leaveReportingManger;
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

	@Override
	public String toString() {
		return "User [empId=" + empId + ", employee=" + employee + ", password=" + password + ", encryptedPassword="
				+ encryptedPassword + ", active=" + active + ", managerId=" + managerId + ", leaveReportingManger="
				+ leaveReportingManger + ", leaveManager=" + leaveManager + ", project=" + project + ", customer="
				+ customer + "]";
	}

}
