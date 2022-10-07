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
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	@Column(name = "emp_id")
	private long empId;

	@Column(name = "emp_name")
	private String empName;

	@Column(name = "emp_password")
	private String empPassword;

	@Column(name = "first_name")
	private String firstName;
	
	@Column(name = "middle_name")
	private String middleName;

	@Column(name = "last_name")
	private String lastName;

	@Column(name = "emp_email")
	private String empEmail;
	
	@Column(name = "emp_phone")
	private String empPhone;
	
	@Column(name = "emp_city")
	private String empCity;
	
	@Column(name = "emp_pincode")
	private String empPincode;

	@Column(name = "emp_address")
	private String empAddress;

	@Column(name = "birthDate")
	private String birthDate;

	@Column(name = "active")
	private String active;

	@Column(name = "manger_Id")
	private String mangerId;

	public Employee() {
		super();
	}

	public Employee(long empId, String empName, String empPassword, String empEmail, String empPhone, String empCity,
			String empPincode, String empAddress, String firstName, String lastName, String middleName,
			String birthDate, String active, String mangerId) {
		super();
		this.empId = empId;
		this.empName = empName;
		this.empPassword = empPassword;
		this.empEmail = empEmail;
		this.empPhone = empPhone;
		this.empCity = empCity;
		this.empPincode = empPincode;
		this.empAddress = empAddress;
		this.firstName = firstName;
		this.lastName = lastName;
		this.middleName = middleName;
		this.birthDate = birthDate;
		this.active = active;
		this.mangerId = mangerId;
	}

	public long getEmpId() {
		return empId;
	}

	public void setEmpId(long empId) {
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

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getMiddleName() {
		return middleName;
	}

	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}

	public String getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}

	public String isActive() {
		return active;
	}

	public void setActive(String active) {
		this.active = active;
	}

	public String isMangerId() {
		return mangerId;
	}

	public void setMangerId(String mangerId) {
		this.mangerId = mangerId;
	}

	@Override
	public String toString() {
		return "Employee [empId=" + empId + ", empName=" + empName + ", empPassword=" + empPassword + ", empEmail="
				+ empEmail + ", empPhone=" + empPhone + ", empCity=" + empCity + ", empPincode=" + empPincode
				+ ", empAddress=" + empAddress + ", firstName=" + firstName + ", lastName=" + lastName + ", middleName="
				+ middleName + ", birthDate=" + birthDate + ", active=" + active + ", mangerId=" + mangerId + "]";
	}
}