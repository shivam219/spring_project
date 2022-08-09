package com.springcore.collections.standalone;

import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

public class Person {
	private List<String> friend;

	public Person() {
		super();
		System.out.println("use default constroctur called");
	}

	public List<String> getFriend() {
		return friend;
	}

	public void setFriend(List<String> friend) {
		this.friend = friend;
		System.out.println("use default setter called");
	}
	
}
