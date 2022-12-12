package com.timesheet.dto;

import java.math.BigDecimal;
import java.math.BigInteger;

public class LeaveDetailsDto {

	String leaveId;
	long empId;
	String empName;
	String managerName;
	String leaveType;
	String startDate;
	String endDate;
	String dayMode;
	String days;

	public LeaveDetailsDto(String leaveId, long empId, String empName, String managerName, String leaveType,
			String startDate, String endDate, String dayMode, String days) {
		super();
		this.leaveId = leaveId;
		this.empId = empId;
		this.empName = empName;
		this.managerName = managerName;
		this.leaveType = leaveType;
		this.startDate = startDate;
		this.endDate = endDate;
		this.dayMode = dayMode;
		this.days = days;
	}

	public LeaveDetailsDto(String leaveId, BigInteger empId, String empName, String managerName, String leaveType,
			String startDate, String endDate, String dayMode, String days) {
		super();
		this.leaveId = leaveId;
		this.empId = empId.longValue();
		this.empName = empName;
		this.managerName = managerName;
		this.leaveType = leaveType;
		this.startDate = startDate;
		this.endDate = endDate;
		this.dayMode = dayMode;
		this.days = days;
	}

	public String getLeaveId() {
		return leaveId;
	}

	public void setLeaveId(String leaveId) {
		this.leaveId = leaveId;
	}

	public long getEmpId() {
		return empId;
	}

	public void setEmpId(long empId) {
		this.empId = empId;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public String getManagerName() {
		return managerName;
	}

	public void setManagerName(String managerName) {
		this.managerName = managerName;
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

	public String getDayMode() {
		return dayMode;
	}

	public void setDayMode(String dayMode) {
		this.dayMode = dayMode;
	}

	public String getDays() {
		return days;
	}

	public void setDays(String days) {
		this.days = days;
	}

	@Override
	public String toString() {
		return "LeaveDetailsDto [leaveId=" + leaveId + ", empId=" + empId + ", empName=" + empName + ", managerName="
				+ managerName + ", leaveType=" + leaveType + ", startDate=" + startDate + ", endDate=" + endDate
				+ ", dayMode=" + dayMode + ", days=" + days + "]";
	}

}
