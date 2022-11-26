package com.timesheet.dto;

public class MonthSheetDataDto {

	String projectName;
	String date;
	String descr;
	String hour;

	public MonthSheetDataDto() {
		super();
	}

	public MonthSheetDataDto(String projectName, String date, String descr, String hour) {
		super();
		this.projectName = projectName;
		this.date = date;
		this.descr = descr;
		this.hour = hour;
	}
	public MonthSheetDataDto(String projectName, String date, String descr, Integer hour) {
		super();
		this.projectName = projectName;
		this.date = date;
		this.descr = descr;
		this.hour = hour.toString();
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getDescr() {
		return descr;
	}

	public void setDescr(String descr) {
		this.descr = descr;
	}

	public String getHour() {
		return hour;
	}

	public void setHour(String hour) {
		this.hour = hour;
	}

	@Override
	public String toString() {
		return "MonthSheetDataDto [projectName=" + projectName + ", date=" + date + ", descr=" + descr + ", hour="
				+ hour + "]";
	}

}
