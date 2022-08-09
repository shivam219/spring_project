package com.springcore.collections;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class App {

	public static void main(String[] args) {
	ApplicationContext context = new ClassPathXmlApplicationContext("com/springcore/collections/config.xml");
		
		Emp ob = (Emp) context.getBean("emp");
		System.out.println(ob);
		System.out.println(ob.getPhone().getClass().getName());
	}

}
