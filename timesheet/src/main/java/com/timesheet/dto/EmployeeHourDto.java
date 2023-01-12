package com.timesheet.dto;

import java.util.LinkedList;

public class EmployeeHourDto {

	String empName;
	LinkedList<ProjectEmpHour> pl;
	int totalHour;

	public EmployeeHourDto() {
		super();
	}

	public EmployeeHourDto(String empName, LinkedList<ProjectEmpHour> pl, int totalHour) {
		super();
		this.empName = empName;
		this.pl = pl;
		this.totalHour = totalHour;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public LinkedList<ProjectEmpHour> getPl() {
		return pl;
	}

	public void setPl(LinkedList<ProjectEmpHour> pl) {
		this.pl = pl;
	}

	public int getTotalHour() {
		return totalHour;
	}

	public void setTotalHour(int totalHour) {
		this.totalHour = totalHour;
	}

	@Override
	public String toString() {
		return "EmployeeHourDto [empName=" + empName + ", pl=" + pl + ", totalHour=" + totalHour + "]";
	}

}
