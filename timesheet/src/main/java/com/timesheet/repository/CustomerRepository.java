package com.timesheet.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.timesheet.model.Customer;

public interface CustomerRepository extends CrudRepository<Customer, Integer> {
	@Modifying
	@Query(value = "delete from customer where customer_id = :CustId", nativeQuery = true)
	@Transactional
	public int deleteCustomnerByCustomerId(long CustId);


	 
	@Query(value = "SELECT customer_name   FROM customer where customer_id = (select customer_id from ess_project where project_id = :pId )", nativeQuery = true)
	public String findProjectNameById(@Param("pId") long pId);
	
	
}
