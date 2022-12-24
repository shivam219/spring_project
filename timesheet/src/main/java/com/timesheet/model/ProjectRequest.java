package com.timesheet.model;

import java.util.Date;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Objects;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PrePersist;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.CreationTimestamp;

@Entity
@Table(name = "timesheet_project_request")
public class ProjectRequest {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	private Long id;

	private Long empId;

	private Long managerId;

	private Long customerId;

	private String projects;

//	@Basic(optional = false)
//	 columnDefinition = "DEFAULT CURRENT_DATE" //getting ere here so remv
//	@Column(name = "requested_date")
//	@Temporal(TemporalType.DATE)
	
	@CreationTimestamp
	@Temporal(TemporalType.TIMESTAMP)
	@Column(updatable = false)
	private Date requestedDate;

	@PrePersist
	private void onCreate() {
		requestedDate = new Date();
	}

	public ProjectRequest() {
		super();
	}

	public ProjectRequest(Long id, Long empId, Long managerId, Long customerId, String projects, Date requestedDate) {
		super();
		this.id = id;
		this.empId = empId;
		this.managerId = managerId;
		this.customerId = customerId;
		this.projects = projects;
		this.requestedDate = requestedDate;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getEmpId() {
		return empId;
	}

	public void setEmpId(Long empId) {
		this.empId = empId;
	}

	public Long getManagerId() {
		return managerId;
	}

	public void setManagerId(Long managerId) {
		this.managerId = managerId;
	}

	public Long getCustomerId() {
		return customerId;
	}

	public void setCustomerId(Long customerId) {
		this.customerId = customerId;
	}

	public String getProjects() {
		return projects;
	}

	public void setProjects(String projects) {
		this.projects = projects;
	}

	public Date getRequestedDate() {
		return requestedDate;
	}

	public void setRequestedDate(Date requestedDate) {
		this.requestedDate = requestedDate;
	}

	public List<String> getProjectsList() {
		if (this.projects.length() > 0) {
			return Arrays.asList(this.projects.split(","));
		}
		return new ArrayList<>();
	}

	@Override
	public String toString() {
		return "ProjectRequest [id=" + id + ", empId=" + empId + ", managerId=" + managerId + ", customerId="
				+ customerId + ", projects=" + projects + ", requestedDate=" + requestedDate + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(customerId, empId, managerId, projects, requestedDate);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		ProjectRequest other = (ProjectRequest) obj;
		return Objects.equals(customerId, other.customerId) && Objects.equals(empId, other.empId)
				&& Objects.equals(managerId, other.managerId) && Objects.equals(projects, other.projects)
				&& ("" + other.getRequestedDate().getDate() + other.getRequestedDate().getMonth()
						+ other.getRequestedDate().getYear())
						.hashCode() == ("" + requestedDate.getDate() + requestedDate.getMonth()
								+ requestedDate.getYear()).hashCode();
	}

}
