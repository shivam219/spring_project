package com.timesheet.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.timesheet.model.Employee;
import com.timesheet.repository.EmployeeRepository;

@Service
public class EmployeeService {
	@Autowired
	private EmployeeRepository employeeRepository;

	public Employee save(Employee employee) {

		System.out.println(employeeRepository.sett());
//		return employeeRepository.save(employee);
		return employee;
	}

	public boolean isExits(Employee employee) {
//		employeeRepository.save(employee);
//		return employeeRepository.existsByEmpIdAndEmpPassword(employee.getEmpId(),employee.getEmpPassword());
		System.out.println(employeeRepository.check(employee.getEmpId(), employee.getEmpAddress()));
//		System.out.println(employeeRepository.checkEmp(employee.getEmpId(), employee.getEmpAddress()));
		return false;
	}

}
