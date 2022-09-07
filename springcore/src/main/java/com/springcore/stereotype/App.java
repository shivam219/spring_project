package com.springcore.stereotype;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class App {
	public static void main(String[] args) {

		ApplicationContext context = new ClassPathXmlApplicationContext("com/springcore/stereotype/config.xml");

		Student ob = (Student) context.getBean("s1");
		Student ob2 = (Student) context.getBean("s1");
		System.out.println(ob == ob2);
		System.out.println(ob);
	}

}
