package com.timesheet.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

@Entity
@Table(name = "ess_employee_project")
public class EmployeeProject {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
//	--don't need different column to map
//	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "emp_pro_seq")
//	@SequenceGenerator(name = "emp_pro_seq" ,sequenceName = "emp_pro_seq" ,schema = "ess" )
//	--end
//	@TableGenerator(name = "emp_pro_seq", table = "emp_pro_seq", schema = "ess")
	@Column(name = "id")
	private int id;

	@Column(name = "emp_id")
	private long empId;

	@Column(name = "project_id")
	private long projectId;

	public EmployeeProject() {
		super();
	}

	public EmployeeProject(int id, long empId, long projectId) {
		super();
		this.id = id;
		this.empId = empId;
		this.projectId = projectId;
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

	public void setEmpId(long empId) {
		this.empId = empId;
	}

	public long getProjectId() {
		return projectId;
	}

	public void setProjectId(long projectId) {
		this.projectId = projectId;
	}

	@Override
	public String toString() {
		return "EmployeeProject [id=" + id + ", empId=" + empId + ", projectId=" + projectId + "]";
	}

}
