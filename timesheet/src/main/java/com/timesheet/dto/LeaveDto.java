package com.timesheet.dto;

public class LeaveDto {

	String leaveType;
	String startDate;
	String endDate;
	String dyas;

	public LeaveDto() {
		super();
	}

	public LeaveDto(String leaveType, String startDate, String endDate, String dyas) {
		super();
		this.leaveType = leaveType;
		this.startDate = startDate;
		this.endDate = endDate;
		this.dyas = dyas;
	}

	public String getLeaveType() {
		return leaveType;
	}

	public void setLeaveType(String leaveType) {
		this.leaveType = leaveType;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getDyas() {
		return dyas;
	}

	public void setDyas(String dyas) {
		this.dyas = dyas;
	}

}