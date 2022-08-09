package com.springcore.ci;

public class Course {

	String course;

	public Course() {
		super();
	}

	public Course(String course) {
		super();
		this.course = course;
		System.out.println("callled" + course);
	}

	public String getCourse() {
		return course;
	}

	public void setCourse(String course) {
		this.course = course;
	}

	@Override
	public String toString() {
		return "Course [course=" + course + "]";
	}

}
