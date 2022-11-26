package com.timesheet.repository;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.timesheet.model.Customer;

@Repository
public interface CustomerRepository extends CrudRepository<Customer, Integer> {
	@Modifying
	@Query(value = "delete from timesheet_customer_master where customer_id = :CustId", nativeQuery = true)
	@Transactional
	public int deleteCustomnerByCustomerId(long CustId);

	@Query(value = "SELECT customer_name   FROM timesheet_customer_master where customer_id = (select customer_id from timesheet_project_master where project_id = :pId )", nativeQuery = true)
	public String findProjectNameById(@Param("pId") long pId);

}
