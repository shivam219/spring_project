package com.springcore.auto.wire.annotation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

public class Emp {
//	even thus we are using private it is able access this property
	@Autowired
//	@Qualifier("address2")
	private Address a;

	public Emp() {
		super();
		System.out.println("Employee default constructor called");
	}
	
	public Emp(Address address) {
		super();
		this.a = address;
		System.out.println("Employee parameterized constructor called");
	}

	public Address getAddress() {
		return a;
	}

	public void setAddress(Address address) {
		this.a = address;
		System.out.println("setter method called");
	}

	@Override
	public String toString() {
		return "Emp [address=" + a + "]";
	}

}
