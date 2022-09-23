package com.timesheet.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.timesheet.model.Customer;
import com.timesheet.model.Project;
import com.timesheet.repository.CustomerRepository;

@Component
public class CustomerService {

	@Autowired
	CustomerRepository repo;

	public Customer save(Customer c) {
		repo.save(c);
		return c;
	}
	
	public List<Customer> getAllcustomer() {
		return (List<Customer>) repo.findAll();
	}

	public int deleteCustomnerByCustomerId(long CustId) {
		return repo.deleteCustomnerByCustomerId(CustId);
	}
	
	
	
}
