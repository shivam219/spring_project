package com.springcore.collections;

import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

public class Emp {
	private String name;
	private List<String> phone;
	private Set<String> address;
	private Map<String, String> map;
//	private Properties prop;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public List<String> getPhone() {
		return phone;
	}

	public void setPhone(List<String> phone) {
		this.phone = phone;
	}

	public Set<String> getAddress() {
		return address;
	}

	public void setAddress(Set<String> address) {
		this.address = address;
	}

	public Map<String, String> getMap() {
		return map;
	}

	public void setMap(Map<String, String> map) {
		this.map = map;
	}

	public Emp(String name, List<String> phone, Set<String> address, Map<String, String> map) {
		super();
		this.name = name;
		this.phone = phone;
		this.address = address;
		this.map = map;
	}

	public Emp() {
		super();
	}

	@Override
	public String toString() {
		return "Emp [name=" + name + ", phone=" + phone + ", address=" + address + ", map=" + map + "]";
	}

}
