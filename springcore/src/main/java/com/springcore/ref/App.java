package com.springcore.ref;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class App {
	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("com/springcore/ref/configg.xml");

		A ob = (A) context.getBean("aa");
//		System.out.println(ob);
		C ob2 = (C) context.getBean("ccc");
		System.out.println(ob2);
		
	}
}
