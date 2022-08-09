package com.springcore;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class App {
	public static void main(String[] args) {
		System.out.println("bean by xml simple property tag ");
//		ApplicationContext context = new ClassPathXmlApplicationContext("config.xml");
		ApplicationContext context = new ClassPathXmlApplicationContext(new String[] { "config.xml", "config2.xml" });
		Student st = (Student) context.getBean("s1");
		Employee emp = (Employee) context.getBean("e1");

		System.out.println(st);
		System.out.println(emp);		

	}
}
