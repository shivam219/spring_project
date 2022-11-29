package com.timesheet.repository;

import java.util.List;
import java.util.Optional;

import javax.persistence.Tuple;
import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.timesheet.model.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {

	@Query(value = "select e.emp_id, concat( first_name, ' ', last_name) as name,UGRP_DESC , um.active from timesheet_user_group_mapping m inner join timesheet_employee_master e \n"
			+ "			inner join timesheet_user_group_master gm inner join  timesheet_user_master um\n"
			+ "			where m.emp_id = e.emp_id and gm.UGRP_CODE = m.ugrp_code and e.emp_id = um.emp_id order by e.first_name", nativeQuery = true)
	public List<String[]> getAllUser();

	@Query(value = "select manager_id FROM ess.timesheet_user_master where emp_id = :empId", nativeQuery = true)
	public Long findManagerIdByEmpId(@Param("empId") Long empId);

	@Modifying
	@Transactional
	@Query(value = "update timesheet_user_master set encrypted_password = sha1(:pass), password = :pass where emp_id = :empId", nativeQuery = true)
	int updateUserPassword(@Param(value = "empId") long empId, @Param(value = "pass") String empPass);

	public Optional<User> findByEmpIdAndPassword(Long empId, String password);

	@Modifying
	@Transactional
	@Query(value = "update timesheet_user_master set active = :active, manager_id = :managerId, leave_manager_id = :leaveManager, leave_reporting_manger = :leaveReportingManager where emp_id = :empId", nativeQuery = true)
	int updateUserDetails(@Param(value = "empId") long empId, @Param(value = "managerId") String managerId, @Param(value = "leaveReportingManager") String leaveReportingManager, @Param(value = "leaveManager") String leaveManager , @Param(value = "active") int active);
	
	public Boolean existsByEmpIdAndPassword(Long empId,String password);
	
	
	@Query(value ="\n"
			+ "with manager as(\n"
			+ "select a.emp_id , concat(a.first_name,' ', a.last_name) as name, b.manager_id, b.active from \n"
			+ "timesheet_employee_master a, timesheet_user_master b where a.emp_id = b.emp_id \n"
			+ ")\n"
			+ "select m.emp_id, m.name, m.manager_id   ,concat(c.first_name,' ', c.last_name)as manager_name, m.active, gm.UGRP_DESC \n"
			+ "from manager m, timesheet_employee_master c, timesheet_user_group_mapping um,timesheet_user_group_master gm\n"
			+ " where m.manager_id = c.emp_id and um.ugrp_code = gm.UGRP_CODE and m.emp_id = um.emp_id",nativeQuery = true)
	public List<Tuple> findEmpNameManagerNameEmpGroupDesc();


	
	@Query(value =" select  b.emp_id,  concat(a.first_name,' ', a.last_name) name  , gm.UGRP_DESC from "
			+ " timesheet_employee_master a, timesheet_user_master b ,"
			+ " timesheet_user_group_mapping um,timesheet_user_group_master gm "
			+ " where a.emp_id = b.emp_id  and  um.emp_id = b.emp_id and gm.UGRP_CODE = um.ugrp_code "
			+ " and b.emp_id = :empId "
			+ " ;",nativeQuery = true)
	public List<Tuple> findEmpNameManagerNameEmpGroupDescByEmpId(@Param(value = "empId") long empId);

	
}
