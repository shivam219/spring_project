package com.timesheet.model;

public class Employee {
	private String empId;
	private String empPwd;

	public Employee() {
		super();
	}

	public String getEmpId() {
		return empId;
	}

	public void setEmpId(String empId) {
		this.empId = empId;
	}

	public String getEmpPwd() {
		return empPwd;
	}

	public void setEmpPwd(String empPwd) {
		this.empPwd = empPwd;
	}

	@Override
	public String toString() {
		return "Employee [empId=" + empId + ", empPwd=" + empPwd + "]";
	}

}
