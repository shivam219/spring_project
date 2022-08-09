package com.springcore.ci;

import java.util.List;

public class Teacher {

	int i;
	String name;
	Course course;
	List<String> list;

	public Teacher() {
		super();
	}

	public Teacher(int i, String name, Course course, List<String> list) {
		super();
		this.i = i;
		this.name = name;
		this.course = course;
		this.list = list;
	}

	public int getI() {
		return i;
	}

	public void setI(int i) {
		this.i = i;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "Teacher [i=" + i + ", name=" + name + ", course=" + course + ", list=" + list + "]";
	}

}
