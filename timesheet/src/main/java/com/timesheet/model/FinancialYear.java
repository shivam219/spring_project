package com.timesheet.model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "timesheet_financial_year")
public class FinancialYear {

	@Id
	private int yearCode;

	private String yearDesc;

	private String empName;

	private String date;

	public FinancialYear() {
		super();

	}

	public FinancialYear(int yearCode, String yearDesc, String empName, String date) {
		super();
		this.yearCode = yearCode;
		this.yearDesc = yearDesc;
		this.empName = empName;
		this.date = date;
	}

	public int getYearCode() {
		return yearCode;
	}

	public void setYearCode(int yearCode) {
		this.yearCode = yearCode;
	}

	public String getYearDesc() {
		return yearDesc;
	}

	public void setYearDesc(String yearDesc) {
		this.yearDesc = yearDesc;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	@Override
	public String toString() {
		return "FinancialYear [yearCode=" + yearCode + ", yearDesc=" + yearDesc + ", empName=" + empName + ", date="
				+ date + "]";
	}

}
