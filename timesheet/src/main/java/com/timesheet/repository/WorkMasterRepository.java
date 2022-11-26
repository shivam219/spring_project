package com.timesheet.repository;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.timesheet.model.WorkMaster;

@Repository
public interface WorkMasterRepository extends JpaRepository<WorkMaster, Long> {

	@Transactional
	@Query(value = " SELECT * FROM ess.timesheet_work_master where emp_id = :empId and start_date = :startDate and end_date = :endDate",nativeQuery = true)
	WorkMaster getWorkMaster(@Param(value = "empId") long empId , @Param(value = "startDate") String empPass, @Param(value = "endDate") String endDate);

	@Modifying
	@Transactional
	@Query(value = " update timesheet_work_master set status = 'Approved' where emp_id = :empId and start_date = :startDate and end_date = :endDate",nativeQuery = true)
	int updateStatusApproved(@Param(value = "empId") long empId , @Param(value = "startDate") String empPass, @Param(value = "endDate") String endDate);

	@Modifying
	@Transactional
	@Query(value = " update timesheet_work_master set status = 'Rejected' where emp_id = :empId and start_date = :startDate and end_date = :endDate",nativeQuery = true)
	int updateStatusRejected(@Param(value = "empId") long empId , @Param(value = "startDate") String empPass, @Param(value = "endDate") String endDate);

	
}

