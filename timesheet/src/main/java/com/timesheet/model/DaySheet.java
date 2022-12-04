package com.timesheet.model;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "timesheet_day_sheet")
public class DaySheet {

	@Id
	@GeneratedValue
	@Column(name = "day_sheet_id")
	private Long daySheetId;

	@Column(name = "date", length = 20)
	private String date;

	@Column(name = "hour")
	private int hour;

//	@Size(min = 3, max = 5 , ", length = 1000 - in column) // hibernate validation
	@Column(name = "descr")
	private String descr;

	@Basic(optional = false)
//	unable to save because of that
//	@ManyToOne(targetEntity = MonthSheet.class)
//	@ManyToOne
	@JoinColumn(name = "month_id")
	private long monthId;

	// getttig errror int this like
//	@ManyToOne(targetEntity = Project.class)
	@JoinColumn(name = "project_id")
	private int projectId;

	public DaySheet() {
	}

	public DaySheet(Long daySheetId, String date, int hour, String descr, long monthId, int projectId) {
		super();
		this.daySheetId = daySheetId;
		this.date = date;
		this.hour = hour;
		this.descr = descr;
		this.monthId = monthId;
		this.projectId = projectId;
	}

	public Long getDaySheetId() {
		return daySheetId;
	}

	public void setDaySheetId(Long daySheetId) {
		this.daySheetId = daySheetId;
	}

	public String getDate() {
		return date;
	}

	@JsonIgnore
	public String getMonth() {
		return date.split("-")[1];
	}

	public void setDate(String date) {
		this.date = date;
	}

	public int getHour() {
		return hour;
	}

	public void setHour(int hour) {
		this.hour = hour;
	}

	public String getDescr() {
		return descr;
	}

	public void setDescr(String descr) {
		this.descr = descr;
	}

	public long getMonthId() {
		return monthId;
	}

	public void setMonthId(long monthId) {
		this.monthId = monthId;
	}

	public int getProjectId() {
		return projectId;
	}

	public void setProjectId(int projectId) {
		this.projectId = projectId;
	}

	@Override
	public String toString() {
		return "DaySheet [daySheetId=" + daySheetId + ", date=" + date + ", hour=" + hour + ", descr=" + descr
				+ ", monthId=" + monthId + ", projectId=" + projectId + "]";
	}

}
