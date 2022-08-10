package com.timesheet.dao;

import java.io.File;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.springframework.stereotype.Repository;

import com.timesheet.model.Employee;

//this will handle curd operation
@Repository
public class EmployeeDao {


/* //-- not using now
 * 	public HibernateTemplate hibernateTemplate;
 */

	public int saveEmployee(Employee employee) {
		Configuration cfg = new Configuration();
		cfg.configure(new File("hibernate.cfg.xml"));
		SessionFactory sf = cfg.buildSessionFactory();
		Session ss = sf.openSession();
		ss.save(employee);
		int id = (Integer) ss.save(employee);
		return 1;
	}

}
