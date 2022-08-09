package com.springcore.auto.wire.annotation;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class App {
	
/* Autowiring - BY ANNOTATIONS
 * use with property
 * default constructor will called and 
 * private property still it able access this property
 * 
 * Use setter method
 * 
 * Use constructor 
 * 
 * @Qaulifier 
 *  defined which bean you want to inject use qualifier
 */
	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("com/springcore/auto/wire/annotation/config.xml");
		Emp ob = context.getBean("emp", Emp.class);
		System.out.println(ob);

	}
}
