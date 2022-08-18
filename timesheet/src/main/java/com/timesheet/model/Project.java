package com.timesheet.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "ess_projects")
public class Project {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int projectid;
	private String projectname;
	private String projectstatus;

	public Project() {
		super();
	}

	public Project(int projectid, String projectname, String projectstatus) {
		super();
		this.projectid = projectid;
		this.projectname = projectname;
		this.projectstatus = projectstatus;
	}

	public int getProjectid() {
		return projectid;
	}

	public void setProjectid(int projectid) {
		this.projectid = projectid;
	}

	public String getProjectname() {
		return projectname;
	}

	public void setProjectname(String projectname) {
		this.projectname = projectname;
	}

	public String getProjectstatus() {
		return projectstatus;
	}

	public void setProjectstatus(String projectstatus) {
		this.projectstatus = projectstatus;
	}

	@Override
	public String toString() {
		return "Project [projectid=" + projectid + ", projectname=" + projectname + ", projectstatus=" + projectstatus
				+ "]";
	}
}
