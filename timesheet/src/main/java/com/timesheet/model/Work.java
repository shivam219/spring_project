package com.timesheet.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "ess_work")
public class Work {

	/* indenity , auto will generate automatic increase by one  from same table last entry
	 *
	 * sequence will take auto increment value from hibernate sequence table
	 * 
	 * Table - Table 'spring.hibernate_sequences' doesn't exist
	 * 
	 * @@EmbeddedId - give error
	 * 
	 * --error - solve - delete table
	 * ava.sql.SQLException: Field 'work_id' doesn't have a 
	 */
	 
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "work_id")
	private int id;
	private String date;
	private String project;
	private String description;
	private String start;
	private String end;

	public Work() {
		super();
 	}

	public Work(String date, String project, String description, String start, String end) {
		super();
		this.date = date;
		this.project = project;
		this.description = description;
		this.start = start;
		this.end = end;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getProject() {
		return project;
	}

	public void setProject(String project) {
		this.project = project;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getstart() {
		return start;
	}

	public void setstart(String start) {
		this.start = start;
	}

	public String getend() {
		return end;
	}

	public void setend(String end) {
		this.end = end;
	}

	@Override
	public String toString() {
		return "EmployeeWork [date=" + date + ", project=" + project + ", description=" + description + ", start="
				+ start + ", end=" + end + "]";
	}

}
