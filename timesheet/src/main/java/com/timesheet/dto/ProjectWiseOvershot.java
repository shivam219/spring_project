package com.timesheet.dto;

public class ProjectWiseOvershot {

	String ProjectName;
	Integer projectWorkingHour;
	Integer projectExpectedHour;

	public ProjectWiseOvershot() {
		super();
	}

	public ProjectWiseOvershot(String projectName, Integer projectWorkingHour, Integer projectExpectedHour) {
		super();
		ProjectName = projectName;
		this.projectWorkingHour = projectWorkingHour;
		this.projectExpectedHour = projectExpectedHour;
	}

	public String getProjectName() {
		return ProjectName;
	}

	public void setProjectName(String projectName) {
		ProjectName = projectName;
	}

	public Integer getProjectWorkingHour() {
		return projectWorkingHour;
	}

	public void setProjectWorkingHour(Integer projectWorkingHour) {
		this.projectWorkingHour = projectWorkingHour;
	}

	public Integer getProjectExpectedHour() {
		return projectExpectedHour;
	}

	public void setProjectExpectedHour(Integer projectExpectedHour) {
		this.projectExpectedHour = projectExpectedHour;
	}

	@Override
	public String toString() {
		return "ProjectWiseOvershot [ProjectName=" + ProjectName + ", projectWorkingHour=" + projectWorkingHour
				+ ", projectExpectedHour=" + projectExpectedHour + "]";
	}

}
