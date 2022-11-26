package com.timesheet.dto;

import java.util.ArrayList;
import java.util.List;

import com.timesheet.model.DaySheet;

public class DaySheetDto {

	String customerName;
	String projectName;
	List<DaySheet> daysheet = new ArrayList<>();

	public DaySheetDto() {
		super();
	}

	public DaySheetDto(String customerName, String projectName, List<DaySheet> daysheet) {
		super();
		this.customerName = customerName;
		this.projectName = projectName;
		this.daysheet = daysheet;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public List<DaySheet> getDaysheet() {
		return daysheet;
	}

	public void setDaysheet(List<DaySheet> daysheet) {
		this.daysheet = daysheet;
	}

	@Override
	public String toString() {
		return "DaySheetDto [customerName=" + customerName + ", projectName=" + projectName + ", daysheet=" + daysheet
				+ "]";
	}

}
