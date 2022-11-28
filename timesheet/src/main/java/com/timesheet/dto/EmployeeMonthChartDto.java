package com.timesheet.dto;

import java.math.BigInteger;

public class EmployeeMonthChartDto {

	short dayCount;
	String task;

	public EmployeeMonthChartDto() {
		super();
	}

	public EmployeeMonthChartDto(short dayCount, String task) {
		super();
		this.dayCount = dayCount;
		this.task = task;
	}
	public EmployeeMonthChartDto(BigInteger dayCount, String task) {
		super();
		this.dayCount = dayCount.shortValue();
		this.task = task;
	}

	public short getDayCount() {
		return dayCount;
	}

	public void setDayCount(short dayCount) {
		this.dayCount = dayCount;
	}

	public String getTask() {
		return task;
	}

	public void setTask(String task) {
		this.task = task;
	}

	@Override
	public String toString() {
		return "EmployeeMonthChartDto [dayCount=" + dayCount + ", task=" + task + "]";
	}

}
