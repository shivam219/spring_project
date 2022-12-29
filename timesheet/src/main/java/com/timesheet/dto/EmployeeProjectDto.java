package com.timesheet.dto;

import java.math.BigDecimal;
import java.math.BigInteger;

public class EmployeeProjectDto {

	String empName;
	String groupDes;
	String hour = "";

	public EmployeeProjectDto() {
		super();
	}

	public EmployeeProjectDto(String empName, String groupDes) {
		super();
		this.empName = empName;
		this.groupDes = groupDes;
	}

	public EmployeeProjectDto(String empName, BigDecimal hour) {
		super();
		this.empName = empName;
		this.hour = hour.toString();
	}

	public EmployeeProjectDto(String empName, String groupDes, BigInteger hour) {
		super();
		this.empName = empName;
		this.groupDes = groupDes;
		this.hour = hour.toString();
	}

	public EmployeeProjectDto(String empName, String groupDes, BigDecimal hour) {
		super();
		this.empName = empName;
		this.groupDes = groupDes;
		this.hour = hour.toString();
	}

	public EmployeeProjectDto(String empName, String groupDes, String hour) {
		super();
		this.empName = empName;
		this.groupDes = groupDes;
		this.hour = hour;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public String getGroupDes() {
		return groupDes;
	}

	public void setGroupDes(String groupDes) {
		this.groupDes = groupDes;
	}

	public String getHour() {
		return hour;
	}

	public void setHour(String hour) {
		this.hour = hour;
	}

}
