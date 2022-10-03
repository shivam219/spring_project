package com.timesheet.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "ess_work_master")
public class WorkMaster {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	Long id;
	@Column(name = "emp_id")
	Long empId;
	@Column(name = "start_date")
	String startDate;
	@Column(name = "end_date")
	String endDate;
	@Column(name = "status")
	String status;

	public WorkMaster() {
		super();
	}

	public WorkMaster(Long empId, String startDate, String endDate, String status) {
		super();
		this.empId = empId;
		this.startDate = startDate;
		this.endDate = endDate;
		this.status = status;
	}

	public Long getEmpId() {
		return empId;
	}

	public void setEmpId(Long empId) {
		this.empId = empId;
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "WorkMaster [empId=" + empId + ", startDate=" + startDate + ", endDate=" + endDate + ", status=" + status
				+ "]";
	}

}
