package com.timesheet.service.Imp;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;


import com.timesheet.model.Employee;
import com.timesheet.service.EmployeeSerivce;

@Repository
public class EmployeeServiceImp implements EmployeeSerivce {
	HibernateTemplate hibernateTemplate;
	public EmployeeServiceImp() {
		super();
	}

	public EmployeeServiceImp(HibernateTemplate hibernateTemplate) {
		super();
		this.hibernateTemplate = hibernateTemplate;
	}


	@Override
	public int save(Employee employee) {
		ApplicationContext context = new ClassPathXmlApplicationContext("com/timesheet/service/Imp/config.xmL");
		EmployeeServiceImp employeeDao = context.getBean("employeeDao", EmployeeServiceImp.class);
		int insert = employeeDao.save(employee);
		return insert;
	}

}
