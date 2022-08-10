package com.timesheet.dao;

import java.io.File;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.springframework.stereotype.Repository;

import com.timesheet.model.Employee;

import com.timesheet.model.Student;

//this will handle curd operation
@Repository
public class EmployeeDao {


/* //-- not using now
 * 	public HibernateTemplate hibernateTemplate;
 */

	public int saveEmployee(Employee employee) {
		System.err.println("--------");
		System.out.println(employee);
		
		Configuration cfg = new Configuration();
		cfg.configure(new File("hibernate.cfg.xml"));
		SessionFactory sf = cfg.buildSessionFactory();
		Session ss = sf.openSession();
		
		Student st = new Student();
		st.setRoll(11);
		st.setCity("mum");
		st.setName("adming");
		ss.save(st);
		ss.getTransaction().commit();
				
//		ss.save(employee);
//		ss.getTransaction().commit();

		return 1;
	}

}
