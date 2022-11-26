package com.timesheet.dto;

import java.math.BigInteger;

public class UserDto {

	long empId;
	String employeeName;
	long managerId;
	String managerName;
	int active;
	String groupDesc;

	public UserDto() {
		super();
	}

	public UserDto(long empId, String employeeName, long managerId, String managerName, int active, String groupDesc) {
		super();
		this.empId = empId;
		this.employeeName = employeeName;
		this.managerId = managerId;
		this.managerName = managerName;
		this.active = active;
		this.groupDesc = groupDesc;
	}

	public UserDto(BigInteger empId, String employeeName, String managerId, String managerName, String active,
			String groupDesc) {
		super();
		this.empId = empId.longValue();
		this.employeeName = employeeName;
		this.managerId = Long.valueOf(managerId);
		this.managerName = managerName;
		this.active = Integer.valueOf(active);
		this.groupDesc = groupDesc;
	}

	public long getEmpId() {
		return empId;
	}

	public void setEmpId(long empId) {
		this.empId = empId;
	}

	public String getEmployeeName() {
		return employeeName;
	}

	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}

	public long getManagerId() {
		return managerId;
	}

	public void setManagerId(long managerId) {
		this.managerId = managerId;
	}

	public String getManagerName() {
		return managerName;
	}

	public void setManagerName(String managerName) {
		this.managerName = managerName;
	}

	public int getActive() {
		return active;
	}

	public void setActive(int active) {
		this.active = active;
	}

	public String getGroupDesc() {
		return groupDesc;
	}

	public void setGroupDesc(String groupDesc) {
		this.groupDesc = groupDesc;
	}

	@Override
	public String toString() {
		return "UserDto [empId=" + empId + ", employeeName=" + employeeName + ", managerId=" + managerId
				+ ", managerName=" + managerName + ", active=" + active + ", groupDesc=" + groupDesc + "]";
	}

}
