package com.timesheet.service;

import org.springframework.stereotype.Service;

import com.timesheet.dao.EmployeeDao;
import com.timesheet.model.Employee;

//define this is service layer 
@Service
public class EmployeeService {

//	@Autowired -- will create and assign object reference
	private EmployeeDao employeeDao  = new EmployeeDao();
	public int saveEmployee(Employee employee) {
		return this.employeeDao.saveEmployee(employee);
	}

}
