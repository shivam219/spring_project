package com.springcore.auto.wire;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class App {
	
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
 */
	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("com/springcore/auto/wire/config.xml");
		Emp ob = context.getBean("emp1", Emp.class);
		System.out.println(ob);

	}
}
