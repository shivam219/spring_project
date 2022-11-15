package com.timesheet.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.timesheet.model.User;

public interface UserRepository extends JpaRepository<User, Long> {

	@Query(value = "select e.emp_id, concat( first_name, ' ', last_name) as name,UGRP_DESC , um.active from ess_user_group_mapping m inner join ess_employee e \n"
			+ "			inner join ess_user_group_master gm inner join  ess_user_master um\n"
			+ "			where m.emp_id = e.emp_id and gm.UGRP_CODE = m.ugrp_code and e.emp_id = um.emp_id order by e.first_name", nativeQuery = true)
	public List<String[]> getAllUser();
}
