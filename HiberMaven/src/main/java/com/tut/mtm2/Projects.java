package com.tut.mtm2;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;


@Entity
public class Projects {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private int eid;
	private String name;

	
	@ManyToMany(mappedBy = "projects")//Emp id  project Id
//	@ManyToMany
	private List<Emp> emp;
	
	/*
	 * 1	101	
	 * 1	102
	 * 1	103
	 * 2	101
	 * 2	102
	 * 2	103
	 */
	public Projects() {
		super();
	}

	public Projects(int eid, String name, List<Emp> emp) {
		super();
		this.eid = eid;
		this.name = name;
		this.emp = emp;
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

	public List<Emp> getemp() {
		return emp;
	}

	public void setProjects(List<Emp> emp) {
		this.emp = emp;
	}

	@Override
	public String toString() {
		return "Projects [eid=" + eid + ", name=" + name + ", projects=" + emp + "]";
	}
}
