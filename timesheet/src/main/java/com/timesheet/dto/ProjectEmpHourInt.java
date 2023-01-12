package com.timesheet.dto;

import java.math.BigDecimal;

public class ProjectEmpHourInt {

	String name;
	BigDecimal hour;

	public ProjectEmpHourInt() {
		super();
	}

	public ProjectEmpHourInt(String name, BigDecimal hour) {
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

	public BigDecimal getHour() {
		return hour;
	}

	public void setHour(BigDecimal hour) {
		this.hour = hour;
	}

	@Override
	public String toString() {
		return "ProjectEmpHour [name=" + name + ", hour=" + hour + "]";
	}

}
