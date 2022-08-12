package com.timesheet.repository;

import org.springframework.data.repository.CrudRepository;

import com.timesheet.model.Employee;

public interface EmployeeRepository extends CrudRepository<Employee, Integer> {

}
