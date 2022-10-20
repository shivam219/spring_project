package com.timesheet.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.timesheet.model.UserGroupMapping;

public interface UserGroupMappingRepository extends JpaRepository<UserGroupMapping, Integer> {
	public Boolean existsByEmpId(Long empId);
	@Query(value = "\n"
			+ "select id, first_name ,UGRP_DESC from ess_user_group_mapping m inner join ess_employee e \n"
			+ "inner join ess_user_group_master gm \n"
			+ "where m.emp_id = e.emp_id and gm.UGRP_CODE = m.ugrp_code", nativeQuery = true)
	public List<String[]> getAllGroup();
	
	

}
