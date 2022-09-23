package com.timesheet.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "ess_project")
public class Project {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	@Column(name = "project_id")
	private int projectId;

	@Column(name = "project_name")
	private String projectName;

	@Column(name = "project_status")
	private String projectStatus;
	
	private String customername;

	
	public Project() {
		super();
	}

	public Project(int projectId, String projectName, String projectStatus) {
		super();
		this.projectId = projectId;
		this.projectName = projectName;
		this.projectStatus = projectStatus;
	}

	public Project(String customername) {
		super();
		this.customername = customername;
	}

	public int getProjectId() {
		return projectId;
		
	}

	public String getCustomername() {
		return customername;
	}

	public void setCustomername(String customername) {
		this.customername = customername;
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

	public String getProjectStatus() {
		return projectStatus;
	}

	public void setProjectStatus(String projectStatus) {
		this.projectStatus = projectStatus;
	}

	@Override
	public String toString() {
		return "Project [customername=" + customername + "]";
	}

}
