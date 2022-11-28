package com.timesheet.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;

@Entity
@Table(name = "timesheet_project_master")
public class Project {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "project_id")
	private int projectId;

	@Column(name = "project_name")
	private String projectName;

	@Column(name = "project_status")
	private int projectStatus;

	@Column(name = "project_day")
	private int projectDay;

	@JsonBackReference(value = "customer-project")
	@ManyToOne()
	@JoinColumn(name = "customer_id")
	private Customer customer;

//	for user project mapping 
//	@Transient
//	@JsonIgnore
//	@ManyToMany(fetch = FetchType.LAZY)
//	@JoinColumn(name = "emp_id")
//	@JsonManagedReference

//	@JsonManagedReference(value = "user-project")

	@JsonBackReference
	@ManyToMany(mappedBy = "project")
	private List<User> user;

	public Project() {
		super();
	}

	public Project(int projectId, String projectName, int projectStatus, int projectDay, Customer customer,
			List<User> user) {
		super();
		this.projectId = projectId;
		this.projectName = projectName;
		this.projectStatus = projectStatus;
		this.projectDay = projectDay;
		this.customer = customer;
		this.user = user;
	}

	public int getProjectId() {
		return projectId;
	}

	public void setProjectId(int projectId) {
		this.projectId = projectId;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public int getProjectStatus() {
		return projectStatus;
	}

	public void setProjectStatus(int projectStatus) {
		this.projectStatus = projectStatus;
	}

	public int getProjectDay() {
		return projectDay;
	}

	public void setProjectDay(int projectDay) {
		this.projectDay = projectDay;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public List<User> getUser() {
		return user;
	}

	public void setUser(List<User> user) {
		this.user = user;
	}

	@Override
	public String toString() {
		return "Project [projectId=" + projectId + ", projectName=" + projectName + ", projectStatus=" + projectStatus
				+ ", projectDay=" + projectDay + ", customer=" + "" + ", user=" + "" + "]";
	}

}
