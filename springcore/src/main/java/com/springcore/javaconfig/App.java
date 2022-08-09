package com.springcore.javaconfig;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

public class App {
	public static void main(String[] args) {
//		ApplicationContext context = new ClassPathXmlApplicationContext("com/springcore/javaconfig/config.xml");

		ApplicationContext context = new AnnotationConfigApplicationContext(XMLConfig.class);
		Student student = context.getBean("student", Student.class);
		System.out.println(student);

	}
}
