package com.timesheet.service;

import java.math.BigInteger;
import java.util.List;
import java.util.stream.Collectors;

import javax.persistence.Tuple;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.timesheet.dto.EmployeeNameDto;
import com.timesheet.model.Employee;
import com.timesheet.repository.EmployeeRepository;

@Service
public class EmployeeService {
	@Autowired
	private EmployeeRepository er;

	public List<Employee> getAllEmployee() {
		return (List<Employee>) er.findAll();
	}

	public String getEmailById(Long empId) {
		return er.getEmailById(empId);
	}

	public 	List<EmployeeNameDto> findEmployeeName() {
		List<Tuple> empName = er.findEmployeeName();
		List<EmployeeNameDto> emp = empName.stream().map(t -> 
		new EmployeeNameDto(t.get(0, BigInteger.class) , t.get(1,String.class)))
				.collect(Collectors.toList());
		return emp;
	}

}
