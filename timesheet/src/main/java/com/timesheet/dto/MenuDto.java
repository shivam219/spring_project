package com.timesheet.dto;

import java.util.List;

public class MenuDto {

	List<String[]> Masters;
	List<String[]> TimesheetApplication;
	List<String[]> LeaveApplication;
	List<List<String[]>> reports;
	List<String[]> admin;

	public MenuDto() {
		super();
	}

	public MenuDto(List<String[]> masters, List<String[]> timesheetApplication, List<String[]> leaveApplication,
			List<List<String[]>> reports, List<String[]> admin) {
		super();
		Masters = masters;
		TimesheetApplication = timesheetApplication;
		LeaveApplication = leaveApplication;
		this.reports = reports;
		this.admin = admin;
	}

	public List<String[]> getMasters() {
		return Masters;
	}

	public void setMasters(List<String[]> masters) {
		Masters = masters;
	}

	public List<String[]> getTimesheetApplication() {
		return TimesheetApplication;
	}

	public void setTimesheetApplication(List<String[]> timesheetApplication) {
		TimesheetApplication = timesheetApplication;
	}

	public List<String[]> getLeaveApplication() {
		return LeaveApplication;
	}

	public void setLeaveApplication(List<String[]> leaveApplication) {
		LeaveApplication = leaveApplication;
	}

	public List<List<String[]>> getReports() {
		return reports;
	}

	public void setReports(List<List<String[]>> reports) {
		this.reports = reports;
	}

	public List<String[]> getAdmin() {
		return admin;
	}

	public void setAdmin(List<String[]> admin) {
		this.admin = admin;
	}

	@Override
	public String toString() {
		return "MenuDto [Masters=" + Masters + ", TimesheetApplication=" + TimesheetApplication + ", LeaveApplication="
				+ LeaveApplication + ", reports=" + reports + ", admin=" + admin + "]";
	}

}
