package com.timesheet.repository;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.timesheet.model.Customer;

public interface CustomerRepository extends CrudRepository<Customer, Integer> {
	@Modifying
	@Query(value = "delete from customer where customerid = :CustId", nativeQuery = true)
	@Transactional
	public int deleteCustomnerByCustomerId(long CustId);

}
