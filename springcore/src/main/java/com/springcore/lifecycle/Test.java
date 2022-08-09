package com.springcore.lifecycle;

import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.context.support.AbstractApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Test {
//	three ways for creating init and destroy method
//	 by xml file -- <bean  init-method="hii" destroy-method="bii"
//	2) interface innplements implements InitializingBean, DisposableBean and over riide methods
//	3) by simple annotation @PreConstruct @PostDEstroy

	public static void main(String[] args) {
		AbstractApplicationContext context = new ClassPathXmlApplicationContext("com/springcore/lifecycle/config.xml");
		context.registerShutdownHook();

//		Samosa ob = (Samosa) context.getBean("samosa");
//		System.out.println(ob);
		coca ob2 = (coca) context.getBean("coca");
		System.out.println(ob2);
	}
}
