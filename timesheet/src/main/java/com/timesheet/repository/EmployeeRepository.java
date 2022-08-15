package com.timesheet.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.timesheet.model.Employee;

@Repository
public interface EmployeeRepository extends CrudRepository<Employee, Integer> {

	public Employee findByEmpIdAndEmpPassword(long empId ,String empPassword);
	public Boolean existsByEmpIdAndEmpPassword(long empId ,String empPassword);

}
