package com.timesheet.dao;

import javax.transaction.Transactional;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.orm.hibernate5.HibernateTemplate;

import com.timesheet.model.Employee;

public class EmployeeDao {

	HibernateTemplate hibernateTemplate;

	public EmployeeDao() {
		super();
	}

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public void setHibernateTemplate(HibernateTemplate hibernateTemplate) {
		this.hibernateTemplate = hibernateTemplate;
	}

	@Transactional
	public int save(Employee employee) {
		Integer i = (Integer) this.hibernateTemplate.save(employee);
//		ApplicationContext context = new ClassPathXmlApplicationContext("com/timesheet/dao/imp/config.xmL");
//		EmployeeDao empDao = context.getBean("employeeDao", EmployeeDao.class);
		return i;
	}

}
