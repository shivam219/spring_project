package com.timesheet.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.timesheet.model.UserGroupMapping;

public interface UserGroupMappingRepository extends JpaRepository<UserGroupMapping, Integer> {
	public Boolean existsByEmpId(Long empId);
	@Query(value = "\n"
			+ "select id, first_name ,UGRP_DESC from timesheet_user_group_mapping m inner join timesheet_employee_master e \n"
			+ "inner join timesheet_user_group_master gm \n"
			+ "where m.emp_id = e.emp_id and gm.UGRP_CODE = m.ugrp_code", nativeQuery = true)
	public List<String[]> getAllGroup();
	
	@Query(value = "with manager as(\n"
			+ "select a.emp_id , concat(a.first_name,' ', a.last_name) as name, b.manager_id from \n"
			+ "timesheet_employee_master a, timesheet_user_master b where a.emp_id = b.emp_id \n"
			+ ")\n"
			+ "select m.emp_id, m.name, m.manager_id ,concat(c.first_name,' ', c.last_name)as manager_name, gm.UGRP_DESC\n"
			+ "from manager m, timesheet_employee_master c, timesheet_user_group_mapping um,timesheet_user_group_master gm\n"
			+ " where m.manager_id = c.emp_id and um.ugrp_code = gm.UGRP_CODE and m.emp_id = um.emp_id;", nativeQuery = true)
	public List<String[]> getAllGroupP();
	
	
	

}
