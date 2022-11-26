package com.timesheet.dto;

import java.math.BigInteger;

public class MonthSheetDto {

	String monthSheetId;
	String employeeName;
	String submitDate;
	String month;
	String year;

	public MonthSheetDto() {
		super();
	}

	public MonthSheetDto(String monthSheetId, String employeeName, String submitDate, String month, String year) {
		super();
		this.monthSheetId = monthSheetId;
		this.employeeName = employeeName;
		this.submitDate = submitDate;
		this.month = month;
		this.year = year;
	}
	public MonthSheetDto(BigInteger monthSheetId, String employeeName, String submitDate, BigInteger month, BigInteger year) {
		super();
		this.monthSheetId = monthSheetId.toString();
		this.employeeName = employeeName;
		this.submitDate = submitDate;
		this.month = month.toString();
		this.year = year.toString();
	}

	public String getMonthSheetId() {
		return monthSheetId;
	}

	public void setMonthSheetId(String monthSheetId) {
		this.monthSheetId = monthSheetId;
	}

	public String getEmployeeName() {
		return employeeName;
	}

	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}

	public String getSubmitDate() {
		return submitDate;
	}

	public void setSubmitDate(String submitDate) {
		this.submitDate = submitDate;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	@Override
	public String toString() {
		return "MonthSheetDto [monthSheetId=" + monthSheetId + ", employeeName=" + employeeName + ", submitDate="
				+ submitDate + ", month=" + month + ", year=" + year + "]";
	}

}
