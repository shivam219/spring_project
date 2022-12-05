package com.timesheet.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

@Entity
@Table(name = "timesheet_leave_master", uniqueConstraints = @UniqueConstraint(columnNames = { "emp_id", "start_date" }))
public class Leave {
	private static final long serialVersionUID = 6832006422622219737L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY) //getting error just drop table and create
	@Column(name = "leave_code", nullable = false)
	private Long leaveCode;

	@Column(name = "leave_id")
	private String leaveId;

	@Column(name = "emp_id" )
	private Long empId;

	@Column(name = "emp_name")
	private String empName;

	@Column(name = "manager_name")
	private String managerName;

	@Column(name = "manager_id")
	private Long managerId;

	@Column(name = "leave_manager_id")
	private Long leaveManagerId;

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

	@Column(name = "second_status")
	private String secondStatus;

	@Column(name = "approve_reason")
	private String approveReason;

	private String secondApproveReason;

	@Column(name = "submitted_date")
	private String submittedDate;

	public Leave() {
		super();
	}

	public Leave(Long leaveCode, String leaveId, Long empId, String empName, String managerName, Long managerId,
			Long leaveManagerId, String dayMode, String leaveType, String leaveReason, String rejectReason,
			String startDate, String endDate, String attachment, String status, String secondStatus,
			String approveReason, String secondApproveReason, String submittedDate) {
		super();
		this.leaveCode = leaveCode;
		this.leaveId = leaveId;
		this.empId = empId;
		this.empName = empName;
		this.managerName = managerName;
		this.managerId = managerId;
		this.leaveManagerId = leaveManagerId;
		this.dayMode = dayMode;
		this.leaveType = leaveType;
		this.leaveReason = leaveReason;
		this.rejectReason = rejectReason;
		this.startDate = startDate;
		this.endDate = endDate;
		this.attachment = attachment;
		this.status = status;
		this.secondStatus = secondStatus;
		this.approveReason = approveReason;
		this.secondApproveReason = secondApproveReason;
		this.submittedDate = submittedDate;
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

	public Long getEmpId() {
		return empId;
	}

	public void setEmpId(Long empId) {
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

	public Long getManagerId() {
		return managerId;
	}

	public void setManagerId(Long managerId) {
		this.managerId = managerId;
	}

	public Long getLeaveManagerId() {
		return leaveManagerId;
	}

	public void setLeaveManagerId(Long leaveManagerId) {
		this.leaveManagerId = leaveManagerId;
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

	public String getSecondStatus() {
		return secondStatus;
	}

	public void setSecondStatus(String secondStatus) {
		this.secondStatus = secondStatus;
	}

	public String getApproveReason() {
		return approveReason;
	}

	public void setApproveReason(String approveReason) {
		this.approveReason = approveReason;
	}

	public String getSecondApproveReason() {
		return secondApproveReason;
	}

	public void setSecondApproveReason(String secondApproveReason) {
		this.secondApproveReason = secondApproveReason;
	}

	public String getSubmittedDate() {
		return submittedDate;
	}

	public void setSubmittedDate(String submittedDate) {
		this.submittedDate = submittedDate;
	}

	@Override
	public String toString() {
		return "Leave [leaveCode=" + leaveCode + ", leaveId=" + leaveId + ", empId=" + empId + ", empName=" + empName
				+ ", managerName=" + managerName + ", managerId=" + managerId + ", leaveManagerId=" + leaveManagerId
				+ ", dayMode=" + dayMode + ", leaveType=" + leaveType + ", leaveReason=" + leaveReason
				+ ", rejectReason=" + rejectReason + ", startDate=" + startDate + ", endDate=" + endDate
				+ ", attachment=" + attachment + ", status=" + status + ", secondStatus=" + secondStatus
				+ ", approveReason=" + approveReason + ", secondApproveReason=" + secondApproveReason
				+ ", submittedDate=" + submittedDate + "]";
	}

}