package com.springcore.auto.wire;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class App2 {
	
/*Autowiring 
 * 1)xml - autowiring modes
 * byName 
 * byType
 * Constructor
 * 2) Annotations
 *---Autowired
 * --autowiring advantages 
 * 	automatic 
 * 	less code
 * autowiring disadvantages
 * no control of programmer 
 * it can't be used for primitive and string values
 * 
 * it usage settter method to set reference by type
 */
	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("com/springcore/auto/wire/config2.xml");
		Teacher ob = context.getBean("teacher", Teacher.class);
		System.out.println(ob);
		College ob2 = context.getBean("college", College.class);
		System.out.println(ob2);
		
		University ob3 = context.getBean("university2", University.class);
		System.out.println(ob3);

	}
}
