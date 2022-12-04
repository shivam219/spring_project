package com.timesheet.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.timesheet.model.Leave;

@Repository
public interface ApproveRepository extends JpaRepository<Leave, Long> {
	public List<Leave> findByManagerIdAndStatus(String managerId, String status);

	public Boolean existsByManagerIdAndStatus(String managerId, String status);

	@Query(value = "select * from timesheet_leave_master where manager_id = :managerId and status = :status order by leave_id asc", nativeQuery = true)
	public List<Leave> findAllFirstManagerList(@Param("managerId") String managerId, @Param("status") String status);

	@Query(value = "select * from timesheet_leave_master where ifnull((leave_manager_id = :leaveManagerId),(manager_id = :managerId)) and second_status = :secondStatus order by leave_id desc;", nativeQuery = true)
	public List<Leave> findAllLastManagerList(@Param("leaveManagerId") String leaveManagerId,
			@Param("managerId") String managerId, @Param("secondStatus") String secondStatus);

//	@Modifying
//	@Transactional
//	@Query(value = "Update timesheet_leave_master set status='Approved' , approve_reason = :approveReason  where leave_id = :leaveId ", nativeQuery = true)
//	public int updateApproveStatus(@Param("leaveId") String leaveId ,@Param("approveReason") String approve_reason);

	@Modifying
	@Transactional
	@Query(value = "Update timesheet_leave_master set status='Rejected' , reject_reason = :rejecReason where leave_id = :leaveId ", nativeQuery = true)
	public int updateRejectStatus(@Param("leaveId") String leaveId, @Param("rejecReason") String reject_reason);

	@Query(value = "select emp_id, concat(first_name,'',last_name)as emp_name from timesheet_employee_master \n"
			+ "where emp_id=(select  ifnull(leave_manager_id, leave_reporting_manager) from timesheet_user_master \n"
			+ "where emp_id= :empId)", nativeQuery = true)
	public List<String[]> getApproveMangerCode(@Param("empId") Long empId);

//	@Modifying
//	@Transactional
//	@Query(value = "update timesheet_leave_master set status =:status ,second_status = :secondStatus,leave_manager_id = :leaveManagerId, approve_reason = :approveReason ,manager_response_date= now() where leave_id = :leaveId", nativeQuery = true)
//	public int firstApprovedStatus(@Param("leaveId") String leaveId , @Param("status") String status, @Param("secondStatus") String secondStatus, @Param("approveReason") String approve_reason, @Param("leaveManagerId") String leaveManagerId);
//	

}
