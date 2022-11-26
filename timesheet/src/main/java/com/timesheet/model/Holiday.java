package com.timesheet.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "timesheet_holiday_master")
public class Holiday {
	@Id
	@GeneratedValue(strategy = GenerationType.TABLE )
	private int hCode;

	private int yearCode;

	private String hDate;

	private String description;

	private String optional;

	public Holiday() {
		super();

	}

	public Holiday(int yearCode, String hDate, String description, int hCode, String optional) {
		super();
		this.yearCode = yearCode;
		this.hDate = hDate;
		this.description = description;
		this.hCode = hCode;
		this.optional = optional;
	}

	public int getYearCode() {
		return yearCode;
	}

	public void setYearCode(int yearCode) {
		this.yearCode = yearCode;
	}

	public String gethDate() {
		return hDate;
	}

	public void sethDate(String hDate) {
		this.hDate = hDate;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public int gethCode() {
		return hCode;
	}

	public void sethCode(int hCode) {
		this.hCode = hCode;
	}

	public String getOptional() {
		return optional;
	}

	public void setOptional(String optional) {
		this.optional = optional;
	}

	@Override
	public String toString() {
		return "Holidays [yearCode=" + yearCode + ", hDate=" + hDate + ", description=" + description + ", hCode="
				+ hCode + ", optional=" + optional + "]";
	}

}
