package com.timesheet.dto;

public class ProjectEmpHour {

	String name;
	String hour;

	public ProjectEmpHour() {
		super();
	}

	public ProjectEmpHour(String name, String hour) {
		super();
		this.name = name;
		this.hour = hour;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getHour() {
		return hour;
	}

	public void setHour(String hour) {
		this.hour = hour;
	}

	@Override
	public String toString() {
		return "ProjectEmpHour [name=" + name + ", hour=" + hour + "]";
	}

}
