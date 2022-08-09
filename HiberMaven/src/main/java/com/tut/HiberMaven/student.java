package com.tut.HiberMaven;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class student {
	@Id
	private int roll;
	private String name;
	private String city;

	private Certificate Certi;

	public student() {
	}

	public student(int roll, String name, String city, Certificate certi) {
		super();
		this.roll = roll;
		this.name = name;
		this.city = city;
		Certi = certi;
	}

	public student(int roll, String name, String city) {
		super();
		this.roll = roll;
		this.name = name;
		this.city = city;
	}

	@Override
	public String toString() {
		return "student [roll=" + roll + ", name=" + name + ", city=" + city + ", Certi=" + Certi + "]";
	}

	public Certificate getCerti() {
		return Certi;
	}

	public void setCerti(Certificate certi) {
		Certi = certi;
	}

	public int getRoll() {
		return roll;
	}

	public void setRoll(int roll) {
		this.roll = roll;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

}
