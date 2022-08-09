package com.springcore.auto.wire;

public class Teacher {

	String name;
	String course;

	public Teacher() {
		super();
	}

	public Teacher(String name, String course) {
		super();
		this.name = name;
		this.course = course;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCourse() {
		return course;
	}

	public void setCourse(String course) {
		this.course = course;
	}

	@Override
	public String toString() {
		return "Teacher [name=" + name + ", course=" + course + "]";
	}

}
