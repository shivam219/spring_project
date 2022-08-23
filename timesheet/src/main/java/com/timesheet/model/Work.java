package com.timesheet.model;

import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "ess_work")
public class Work {

	/*
	 * indenity , auto will generate automatic increase by one from same table last
	 * entry
	 *
	 * sequence will take auto increment value from hibernate sequence table
	 * 
	 * Table - Table 'spring.hibernate_sequences' doesn't exist
	 * 
	 * @@EmbeddedId - give error
	 * 
	 * --error - solve - delete table ava.sql.SQLException: Field 'work_id' doesn't
	 * have a
	 */

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	private int id;

	@Column(name = "emp_id")
	private long empId;

	@Column(name = "project_id")
	private int project;

	@Transient
	@Column(name = "project_name")
	private String projectName;
	
	@Column(name = "start_date")
	private String start_date;

	@Column(name = "hours")
	private String hours;

	@Column(name = "descr")
	private String descr;

	@Column(name = "day")
	private String day;

	@Column(name = "status")
	private String status;
	
	

	public Work() {
		super();
	 }
 

	public Work(int id, long empId, int project, String projectName, String start_date, String hours, String descr,
			String day, String status) {
		super();
		this.id = id;
		this.empId = empId;
		this.project = project;
		this.projectName = projectName;
		this.start_date = start_date;
		this.hours = hours;
		this.descr = descr;
		this.day = day;
		this.status = status;
	}


	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public long getEmpId() {
		return empId;
	}

	
	public String getProjectName() {
		return projectName;
	}


	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}


	public void setEmpId(long empId) {
		this.empId = empId;
	}

	public int getProject() {
		return project;
	}

	public void setProject(int project) {
		this.project = project;
	}

	public String getStart_date() {
		return start_date;
	}

	public void setStart_date(String start_date) {
		this.start_date = start_date;
	}

	public String getHours() {
		return hours;
	}

	public void setHours(String hours) {
		this.hours = hours;
	}

	public String getDescr() {
		return descr;
	}

	public void setDescr(String descr) {
		this.descr = descr;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}


	@Override
	public int hashCode() {
		return Objects.hash(day, descr, empId, hours, id, project, projectName, start_date, status);
	}


	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Work other = (Work) obj;
		return Objects.equals(day, other.day) && Objects.equals(descr, other.descr) && empId == other.empId
				&& Objects.equals(hours, other.hours) && id == other.id && project == other.project
				&& Objects.equals(projectName, other.projectName) && Objects.equals(start_date, other.start_date)
				&& Objects.equals(status, other.status);
	}


	@Override
	public String toString() {
		return "Work [id=" + id + ", empId=" + empId + ", project=" + project + ", projectName=" + projectName
				+ ", start_date=" + start_date + ", hours=" + hours + ", descr=" + descr + ", day=" + day + ", status="
				+ status + "]";
	}

	
	
}
