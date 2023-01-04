package com.timesheet.model;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.ColumnResult;
import javax.persistence.ConstructorResult;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.NamedNativeQuery;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.SqlResultSetMapping;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.timesheet.dto.ProjectEmpHour;

//@formatter:off
@NamedNativeQuery(
		name =  "find_project_employee_hour", 
		query = "select  concat(first_name,' ',last_name) emp_name ,  sum(hour) emp_hour from timesheet_day_sheet tds\n"
				+ "inner join timesheet_employee_master tem on tds.emp_id = tem.emp_id\n"
				+ "where  project_id = :projectId and month(date) = :month and year(date) =  :year group by tds.emp_id , concat(first_name,' ',last_name)\n"
				+ "union select concat( 'Total Efforts for  November month ', :year), ifnull(sum(hour),0)  from timesheet_day_sheet where  project_id = :projectId and month(date) = :month and year(date) =  :year\n"
				+ "union select concat( 'Total Efforts till November month ', :year), ifnull(sum(hour),0)  from timesheet_day_sheet\n"
				+ "where  project_id = :projectId and  date <= LAST_DAY( DATE_ADD( MAKEDATE(:year, :month), INTERVAL ( :month - 1 ) month))\n"
				+ "union select concat( 'Expected Total Efforts: '),  ( project_day*24)  from timesheet_project_master where project_id =  :projectId",	
		resultSetMapping = "find_project_employee_hour_dto",resultClass =ProjectEmpHour.class )
@SqlResultSetMapping(name = "find_project_employee_hour_dto", 
	classes = @ConstructorResult(
			targetClass = ProjectEmpHour.class, 
			columns = {
					@ColumnResult(name = "emp_name", type = String.class),
					@ColumnResult(name = "emp_hour", type = String.class),
				}
			)
	)
//@formatter:on
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

	@Column(name = "emp_id")
	private long empId;

	public DaySheet() {
	}

	public DaySheet(Long daySheetId, String date, int hour, String descr, long monthId, int projectId, long empId) {
		super();
		this.daySheetId = daySheetId;
		this.date = date;
		this.hour = hour;
		this.descr = descr;
		this.monthId = monthId;
		this.projectId = projectId;
		this.empId = empId;
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

	public long getEmpId() {
		return empId;
	}

	public void setEmpId(long empId) {
		this.empId = empId;
	}

	@Override
	public String toString() {
		return "DaySheet [daySheetId=" + daySheetId + ", date=" + date + ", hour=" + hour + ", descr=" + descr
				+ ", monthId=" + monthId + ", projectId=" + projectId + ", empId=" + empId + "]";
	}

}
