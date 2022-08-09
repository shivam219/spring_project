package com.tut.HiberMaven;

import java.util.Scanner;

import org.hibernate.Session;

public class FetchDemo {
	public static void main(String[] args) {
		Session ss = ConnectionProvider.getIntance();
		student st1 = (student) ss.get("com.tut.HiberMaven.student", 5);
		System.out.println(st1);
		
		/*
		 * default constructor for entity: should be define weather your using get or load
		 */
//		student st2 = (student) ss.load(student.class, 4);
//		if object not then return null
//		System.out.println(st2);
//		System.out.println(student.class);
//		class com.tut.HiberMaven.student give qualified name of class
//		boolean value store in form of hexadecimal
		/*
		 * load() load method return proxy or empty object until you method of that
		 * object it call two time one empty then getId(), calling toString method if getId() called next then
		 * 1) first just check weather object present in database 
		 * 2) second fetch real value of attribute of object
		 * data is assign to original object so it not called to database FF
		 * update to late updating so use commit while updating data real time
		 */
		Address ad = (Address) ss.load("com.tut.HiberMaven.Address", 1);
		System.out.println();
		System.out.println("enter to get new values" + new Scanner(System.in).next());
		System.out.println(ad.getCity());

	}
}
