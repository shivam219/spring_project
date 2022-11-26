package com.timesheet.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "timesheet_employee_master")
public class Employee {
	@Id
	@Column(name = "emp_id")
	private long empId;

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

	@Column(name = "gender")
	private String gender;

	@Column(name = "state")
	private String state;

	@Column(name = "date_of_join")
	private String dateOfJoin;

	@Column(name = "date_of_resign")
	private String dateOfResign;

	@Column(name = "created_by")
	private String createdBy;

	@Column(name = "created_time")
	private String createdTime;

	@Column(name = "modified_by")
	private String modifiedBy;

	@Column(name = "modified_time")
	private String modifiedTime;

	@JsonIgnore
	@OneToOne(mappedBy = "employee")
	User user;

	public Employee() {
		super();
	}

	public Employee(long empId, String firstName, String middleName, String lastName, String empEmail, String empPhone,
			String empCity, String empPincode, String empAddress, String birthDate, String gender, String state,
			String dateOfJoin, String dateOfResign, String createdBy, String createdTime, String modifiedBy,
			String modifiedTime, User user) {
		super();
		this.empId = empId;
		this.firstName = firstName;
		this.middleName = middleName;
		this.lastName = lastName;
		this.empEmail = empEmail;
		this.empPhone = empPhone;
		this.empCity = empCity;
		this.empPincode = empPincode;
		this.empAddress = empAddress;
		this.birthDate = birthDate;
		this.gender = gender;
		this.state = state;
		this.dateOfJoin = dateOfJoin;
		this.dateOfResign = dateOfResign;
		this.createdBy = createdBy;
		this.createdTime = createdTime;
		this.modifiedBy = modifiedBy;
		this.modifiedTime = modifiedTime;
		this.user = user;
	}

	public long getEmpId() {
		return empId;
	}

	public void setEmpId(long empId) {
		this.empId = empId;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getMiddleName() {
		return middleName;
	}

	public void setMiddleName(String middleName) {
		this.middleName = middleName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
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

	public String getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getDateOfJoin() {
		return dateOfJoin;
	}

	public void setDateOfJoin(String dateOfJoin) {
		this.dateOfJoin = dateOfJoin;
	}

	public String getDateOfResign() {
		return dateOfResign;
	}

	public void setDateOfResign(String dateOfResign) {
		this.dateOfResign = dateOfResign;
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

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	public String getFullName() {
		return firstName + " " + lastName;
	}

	@Override
	public String toString() {
		return "Employee [empId=" + empId + ", firstName=" + firstName + ", middleName=" + middleName + ", lastName="
				+ lastName + ", empEmail=" + empEmail + ", empPhone=" + empPhone + ", empCity=" + empCity
				+ ", empPincode=" + empPincode + ", empAddress=" + empAddress + ", birthDate=" + birthDate + ", gender="
				+ gender + ", state=" + state + ", dateOfJoin=" + dateOfJoin + ", dateOfResign=" + dateOfResign
				+ ", createdBy=" + createdBy + ", createdTime=" + createdTime + ", modifiedBy=" + modifiedBy
				+ ", modifiedTime=" + modifiedTime + ", user=nestedcallederroe]";
	}

}