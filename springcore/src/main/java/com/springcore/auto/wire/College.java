package com.springcore.auto.wire;

public class College {
	String name;
	Teacher teacher;
	String address;

	public College() {
		super();
	}
	public College(String name, Teacher teacher ) {
		super();
		this.name = name;
		this.teacher = teacher;
		 
	}
	public College(String name, Teacher teacher, String address) {
		super();
		this.name = name;
		this.teacher = teacher;
		this.address = address;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Teacher getTeacher() {
		return teacher;
	}

	public void setTeacher(Teacher teacher) {
		this.teacher = teacher;
	}

	@Override
	public String toString() {
		return "College [name=" + name + ", teacher=" + teacher + ", address=" + address + "]";
	}

}
