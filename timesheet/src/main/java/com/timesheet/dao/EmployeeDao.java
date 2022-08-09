package com.timesheet.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;

import com.timesheet.model.Employee;

//this will handle curd operation
@Repository
public class EmployeeDao {
	
//	@Autowired
	public HibernateTemplate hibernateTemplate;

	public int saveEmployee(Employee employee) {

		int id = (Integer) this.hibernateTemplate.save(employee);
		return 1;
	}

}
