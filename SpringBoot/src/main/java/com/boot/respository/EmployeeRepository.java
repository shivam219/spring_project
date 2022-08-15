package com.boot.respository;

import org.springframework.data.repository.CrudRepository;

import com.boot.model.Employee;

public interface EmployeeRepository  extends CrudRepository<Employee, Integer> {
	public Employee findByEmpIdAndEmpPassword(int empId ,String empPassword);
	public Boolean existsByEmpIdAndEmpPassword(int empId ,String empPassword);

}
