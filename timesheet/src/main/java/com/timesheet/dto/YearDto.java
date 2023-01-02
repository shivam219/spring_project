package com.timesheet.dto;

public class YearDto {
	String yearDesc;

	public YearDto(String yearDesc) {
		super();
		this.yearDesc = yearDesc;
	}

	public YearDto() {
		super();
	}

	public String getYearDesc() {
		return yearDesc;
	}

	public void setYearDesc(String yearDesc) {
		this.yearDesc = yearDesc;
	}

	@Override
	public String toString() {
		return "YearDto [yearDesc=" + yearDesc + "]";
	}

}
