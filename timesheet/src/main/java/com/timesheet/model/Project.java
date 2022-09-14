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
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "project_id")
	private int projectId;

	@Column(name = "project_name")
	private String projectName;

	@Column(name = "project_status")
	private String projectStatus;

	public Project() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Project(int projectId, String projectName, String projectStatus) {
		super();
		this.projectId = projectId;
		this.projectName = projectName;
		this.projectStatus = projectStatus;
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

	public String getProjectStatus() {
		return projectStatus;
	}

	public void setProjectStatus(String projectStatus) {
		this.projectStatus = projectStatus;
	}

	@Override
	public String toString() {
		return "Project [projectId=" + projectId + ", projectName=" + projectName + ", projectStatus=" + projectStatus
				+ "]";
	}

}
