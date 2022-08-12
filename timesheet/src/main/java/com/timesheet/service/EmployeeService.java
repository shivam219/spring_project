package com.timesheet.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.timesheet.model.Employee;
import com.timesheet.repository.EmployeeRepository;

@Service
public class EmployeeService {
	@Autowired
	private EmployeeRepository  employeeRepository;
	public Employee save(Employee employee) {
		return employeeRepository.save(employee);
	}
	
	
	
	
}
