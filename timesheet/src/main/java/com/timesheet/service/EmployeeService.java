package com.timesheet.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.timesheet.model.Employee;
import com.timesheet.repository.EmployeeRepository;

@Service
public class EmployeeService {
	@Autowired
	private EmployeeRepository employeeRepository;

	public Employee save(Employee e) {
		employeeRepository.saveEmployee(e.getEmpId(), e.getEmpName() , e.getEmpEmail(),e.getEmpPassword() , e.getEmpCity(), e.getEmpAddress(), e.getEmpPhone(), e.getEmpPincode());
		return e;
	}

	public Employee isValidEmployee(Employee employee) {
		Employee emp = null;
		try { 
			emp = employeeRepository.isValidEmployee(14,"root");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return emp;
	}

}
