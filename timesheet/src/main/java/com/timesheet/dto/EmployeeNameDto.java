package com.timesheet.dto;

import java.math.BigInteger;

public class EmployeeNameDto {

	Long empId;
	String employeeName;

	public EmployeeNameDto() {
		super();
	}

	public EmployeeNameDto(Long empId, String employeeName) {
		super();
		this.empId = empId;
		this.employeeName = employeeName;
	}

	public EmployeeNameDto(BigInteger empId, String employeeName) {
		this.empId = empId.longValue();
		this.employeeName = employeeName;
	}

	public Long getEmpId() {
		return empId;
	}

	public void setEmpId(Long empId) {
		this.empId = empId;
	}

	public String getEmployeeName() {
		return employeeName;
	}

	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}

	@Override
	public String toString() {
		return "EmployeeNameDto [empId=" + empId + ", EmployeeName=" + employeeName + "]";
	}

}
