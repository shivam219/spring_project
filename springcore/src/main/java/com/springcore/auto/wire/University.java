package com.springcore.auto.wire;

public class University {

	Teacher teacher;

	public University() {
		super();
	}


	public University(Teacher teacher) {
		super();
		this.teacher = teacher;
	}

	
	
	public Teacher getTeacher() {
		return teacher;
	}


	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}


	@Override
	public String toString() {
		return "University [teacher=" + teacher + "]";
	}

}
