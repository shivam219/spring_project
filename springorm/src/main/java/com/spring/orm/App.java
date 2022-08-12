package com.spring.orm;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.spring.orm.dao.StudentDao;
import com.spring.orm.entities.Student;

/**
 * Hello world!
 *
 */
public class App {
	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("com/spring/orm/config.xmL");
		//ApplicationContext context = new ClassPathXmlApplicationContext("main/resources/app-context.xml");
	
		StudentDao studentDao = context.getBean("studentDao", StudentDao.class);
		Student st = new Student();
		st.setStudentId(10);
		st.setStudentName("Shivam");
		st.setStudentCity("mumbai");
		
		int insert = studentDao.insert(st);
		System.out.println(insert);
	}
}
