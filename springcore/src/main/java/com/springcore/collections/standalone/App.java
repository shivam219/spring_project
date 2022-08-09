package com.springcore.collections.standalone;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class App {

	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext(
				"com/springcore/collections/standalone/config.xml");
		Person ob = (Person) context.getBean("person");
		System.out.println(ob);
		
		System.out.println(ob.getClass().hashCode());
	}

}
