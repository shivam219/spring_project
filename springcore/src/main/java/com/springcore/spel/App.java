package com.springcore.spel;


import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.expression.Expression;
import org.springframework.expression.spel.standard.SpelExpressionParser;

public class App {
	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("com/springcore/spel/config.xml");
		Student ob = (Student) context.getBean("s1");
		System.out.println(ob);

		SpelExpressionParser temp = new SpelExpressionParser();
		Expression expression =   temp.parseExpression("20+4");
		
	}

}
