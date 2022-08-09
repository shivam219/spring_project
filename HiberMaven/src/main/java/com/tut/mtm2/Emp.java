package com.tut.mtm2;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;

@Entity
public class Emp {
	@Id
	private int eid;
	private String name;
//	@ManyToMany(mappedBy = "emp")//
//	project_id  emp_id 
	@ManyToMany
	@JoinTable(name="emp_project_details",
	joinColumns =  { @JoinColumn(name="E_id")}, 
	inverseJoinColumns =  {   @JoinColumn(name="project_id") }
			)
	private List<Projects> projects;
	

	public Emp() {
		super();
	}

	public Emp(int eid, String name, List<Projects> projects) {
		super();
		this.eid = eid;
		this.name = name;
		this.projects = projects;
	}

	public int getEid() {
		return eid;
	}

	public void setEid(int eid) {
		this.eid = eid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<Projects> getProjects() {
		return projects;
	}

	public void setProjects(List<Projects> projects) {
		this.projects = projects;
	}

	@Override
	public String toString() {
		return "Emp [eid=" + eid + ", name=" + name + ", projects=" + projects + "]";
	}

}
