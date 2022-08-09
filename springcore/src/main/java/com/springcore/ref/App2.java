package com.springcore.ref;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class App2 {
	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("com/springcore/ref/configg2.xml");

		AA aa = (AA) context.getBean("aa");
		System.out.println(aa);
		
		BB bb = (BB) context.getBean("bb");
		System.out.println(bb);

	}
}
