package com.springcore;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class App {
	public static void main(String[] args) {
		System.out.println("bean by xml simple property tag ");
//		ApplicationContext context = new ClassPathXmlApplicationContext("config.xml");
		ApplicationContext context = new ClassPathXmlApplicationContext(new String[] { "config.xml", "config2.xml" });
//		Student st = (Student) context.getBean("s1");
//		System.out.println(st);
		
		Employee emp1 = (Employee) context.getBean("e1");
		emp1.setEmpId(99);
		Employee emp2 = (Employee) context.getBean("e1");
		
		System.out.println(emp1.hashCode());		
		System.out.println(emp2.hashCode());

		System.out.println(emp1);
		System.out.println(emp2);

	}
}
