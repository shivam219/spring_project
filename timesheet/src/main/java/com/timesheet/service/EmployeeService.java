package com.timesheet.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.timesheet.model.Employee;
import com.timesheet.repository.EmployeeRepository;

@Service
public class EmployeeService {
	@Autowired
	private EmployeeRepository employeeRepository;

	public Employee save(Employee e) {
//		employeeRepository.save(e);
	System.out.println(	employeeRepository.saveEmployee(e.getEmpId(), e.getEmpName(), e.getEmpEmail(), e.getEmpPassword(),
				e.getEmpCity(), e.getEmpAddress(), e.getEmpPhone(), e.getEmpPincode()));
		return e;
	}

	public Employee isValidEmployee(Employee empu) {
		Employee emp = null;
		try {
			emp = employeeRepository.isValidEmployee(empu.getEmpId(), empu.getEmpPassword());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return emp;
	}

	public List<Employee> getAllEmployee() {
		return (List<Employee>) employeeRepository.findAll();
	}

}
