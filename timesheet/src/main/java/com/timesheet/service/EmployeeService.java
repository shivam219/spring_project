package com.timesheet.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.timesheet.dao.EmployeeDao;
import com.timesheet.model.Employee;

//define this is service layer 
@Service
public class EmployeeService {

//	@Autowired
	private EmployeeDao employeeDao;
	public int saveEmployee(Employee employee) {
		return this.employeeDao.saveEmployee(employee);
	}

}
