package com.springcore.ci;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
 

public class App2 {
	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("com/springcore/ci/config2.xml");

		Teacher ob = (Teacher) context.getBean("teacher");
		System.out.println(ob);
		
	
	}
}
