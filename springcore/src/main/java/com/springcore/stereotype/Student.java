package com.springcore.stereotype;

import java.util.List;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

@Component("s1")
//@Scope("prototype")
public class Student {

	@Value("Shivam choudhary")
	String studentName;
	@Value("rewa")
	String city;

	@Value("#{myAddress}")
	List<String> address;

	public Student() {
		super();
		System.out.println("default called");
	}

	public Student(String studentName, String city, List<String> address) {
		super();
		this.studentName = studentName;
		this.city = city;
		this.address = address;
		System.out.println("parameter called");
	}

	public String getStudentName() {
		return studentName;
	}

	public void setStudentName(String studentName) {
		this.studentName = studentName;
		System.out.println("setter called");
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public List<String> getAddress() {
		return address;
	}

	public void setAddress(List<String> address) {
		this.address = address;
	}

	@Override
	public String toString() {
		return "Student [studentName=" + studentName + ", city=" + city + ", address=" + address + "]";
	}
 

}
