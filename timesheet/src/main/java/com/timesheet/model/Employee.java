package com.timesheet.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "ess_employee")
public class Employee {
	
//	using id is integer but in bean it is string need to change further
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "emp_id")
	int empId;

	@Column(name = "emp_name")
	String empName;
	
	@Column(name = "emp_password")
	String empPassword;
	
	@Column(name = "emp_email")
	String empEmail;
	
	@Column(name = "emp_phone")
	String empPhone;

	@Column(name = "emp_city")
	String empCity;

	@Column(name = "emp_pincode")
	String empPincode;

	@Column(name = "emp_address")
	String empAddress;
	public Employee() {
		super();
	}
	public Employee(int empId, String empName, String empPassword, String empEmail, String empPhone, String empCity,
			String empPincode, String empAddress) {
		super();
		this.empId = empId;
		this.empName = empName;
		this.empPassword = empPassword;
		this.empEmail = empEmail;
		this.empPhone = empPhone;
		this.empCity = empCity;
		this.empPincode = empPincode;
		this.empAddress = empAddress;
	}
	public int getEmpId() {
		return empId;
	}
	public void setEmpId(int empId) {
		this.empId = empId;
	}
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public String getEmpPassword() {
		return empPassword;
	}
	public void setEmpPassword(String empPassword) {
		this.empPassword = empPassword;
	}
	public String getEmpEmail() {
		return empEmail;
	}
	public void setEmpEmail(String empEmail) {
		this.empEmail = empEmail;
	}
	public String getEmpPhone() {
		return empPhone;
	}
	public void setEmpPhone(String empPhone) {
		this.empPhone = empPhone;
	}
	public String getEmpCity() {
		return empCity;
	}
	public void setEmpCity(String empCity) {
		this.empCity = empCity;
	}
	public String getEmpPincode() {
		return empPincode;
	}
	public void setEmpPincode(String empPincode) {
		this.empPincode = empPincode;
	}
	public String getEmpAddress() {
		return empAddress;
	}
	public void setEmpAddress(String empAddress) {
		this.empAddress = empAddress;
	}
	@Override
	public String toString() {
		return "Employee [empId=" + empId + ", empName=" + empName + ", empPassword=" + empPassword + ", empEmail="
				+ empEmail + ", empPhone=" + empPhone + ", empCity=" + empCity + ", empPincode=" + empPincode
				+ ", empAddress=" + empAddress + "]";
	}
}