package com.timesheet.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.beans.factory.annotation.Value;

@Entity
@Table(name = "leave_master")
public class Leave {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "leave_code")
	private Long leaveCode;

	@Column(name = "leave_id")
	private String leaveId;

	@Column(name = "emp_id")
	private String empId;

	@Column(name = "emp_name")
	private String empName;

	@Column(name = "manager_name")
	private String managerName;

	@Column(name = "manager_id")
	private String managerId;

	@Column(name = "day_mode")
	private String dayMode;

	@Column(name = "leave_type")
	private String leaveType;

	@Column(name = "leave_reason")
	private String leaveReason;

	@Column(name = "reject_reason")
	private String rejectReason;

	@Column(name = "start_date")
	private String startDate;

	@Column(name = "end_date")
	private String endDate;

	@Column(name = "attachment")
	private String attachment;
    
	@Column(name = "status")
	private String status;

	@Column(name="approve_reason")
	private String approveReason;

	public Leave() {
		super();
		
	}

	public Leave(Long leaveCode, String leaveId, String empId, String empName, String managerName, String managerId,
			String dayMode, String leaveType, String leaveReason, String rejectReason, String startDate, String endDate,
			String attachment, String status, String approveReason) {
		super();
		this.leaveCode = leaveCode;
		this.leaveId = leaveId;
		this.empId = empId;
		this.empName = empName;
		this.managerName = managerName;
		this.managerId = managerId;
		this.dayMode = dayMode;
		this.leaveType = leaveType;
		this.leaveReason = leaveReason;
		this.rejectReason = rejectReason;
		this.startDate = startDate;
		this.endDate = endDate;
		this.attachment = attachment;
		this.status = status;
		this.approveReason = approveReason;
	}

	public Long getLeaveCode() {
		return leaveCode;
	}

	public void setLeaveCode(Long leaveCode) {
		this.leaveCode = leaveCode;
	}

	public String getLeaveId() {
		return leaveId;
	}

	public void setLeaveId(String leaveId) {
		this.leaveId = leaveId;
	}

	public String getEmpId() {
		return empId;
	}

	public void setEmpId(String empId) {
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

	public String getManagerId() {
		return managerId;
	}

	public void setManagerId(String managerId) {
		this.managerId = managerId;
	}

	public String getDayMode() {
		return dayMode;
	}

	public void setDayMode(String dayMode) {
		this.dayMode = dayMode;
	}

	public String getLeaveType() {
		return leaveType;
	}

	public void setLeaveType(String leaveType) {
		this.leaveType = leaveType;
	}

	public String getLeaveReason() {
		return leaveReason;
	}

	public void setLeaveReason(String leaveReason) {
		this.leaveReason = leaveReason;
	}

	public String getRejectReason() {
		return rejectReason;
	}

	public void setRejectReason(String rejectReason) {
		this.rejectReason = rejectReason;
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

	public String getAttachment() {
		return attachment;
	}

	public void setAttachment(String attachment) {
		this.attachment = attachment;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getApproveReason() {
		return approveReason;
	}

	public void setApproveReason(String approveReason) {
		this.approveReason = approveReason;
	}

	@Override
	public String toString() {
		return "Leave [leaveCode=" + leaveCode + ", leaveId=" + leaveId + ", empId=" + empId + ", empName=" + empName
				+ ", managerName=" + managerName + ", managerId=" + managerId + ", dayMode=" + dayMode + ", leaveType="
				+ leaveType + ", leaveReason=" + leaveReason + ", rejectReason=" + rejectReason + ", startDate="
				+ startDate + ", endDate=" + endDate + ", attachment=" + attachment + ", status=" + status
				+ ", approveReason=" + approveReason + "]";
	}
	
	
	

}
