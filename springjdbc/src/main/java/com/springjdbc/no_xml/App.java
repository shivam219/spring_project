package com.springjdbc.no_xml;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
public class App {
	public static void main(String[] args) {
		ApplicationContext applicationContext = new AnnotationConfigApplicationContext(
				jdbcConfig.class);
//		JdbcTemplate jdbcTemplate = applicationContext.getBean("jdbcTemplate", JdbcTemplate.class);
		/*
		 * // not required this line will difference way below String sql1 =
		 * "insert into student values(5,'shivam','rewa')";
		 * System.out.println(jdbcTemplate.update(sql1));
		 * System.out.println("record inserted"); String sql2 =
		 * "insert into student(id,name,city) values(?,?,?)";
		 * System.out.println(jdbcTemplate.update(sql1,10,"shivma","rewa"));
		 */

		StudentDao dao = applicationContext.getBean("studentDao", StudentDao.class);
		Student student = new Student();
		student.setId(20);
		student.setName("deepak");
		student.setCity("mumbai");

		int insert = dao.insert(student);
		System.out.println(insert);
		System.out.println(dao.get(205));

	}
}
