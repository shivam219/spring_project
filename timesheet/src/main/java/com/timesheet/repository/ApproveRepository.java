package com.timesheet.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.timesheet.model.Leave;

public interface ApproveRepository extends JpaRepository<Leave, Long> {
	public List<Leave> findByManagerIdAndStatus(String managerId, String status);

	public Boolean existsByManagerIdAndStatus(String managerId, String status);

	@Query(value = "SELECT * FROM leave_Master", nativeQuery = true)
	public List<Leave> isValidApprove(@Param("managerId") String managerId, @Param("status") String status);

	@Modifying
	@Transactional
	@Query(value = "Update leave_master set status='Approved' , approve_reason = :approveReason  where leave_id = :leaveId ", nativeQuery = true)
	public int updateApproveStatus(@Param("leaveId") String leaveId ,@Param("approveReason") String approve_reason);

	@Modifying
	@Transactional
	@Query(value = "Update leave_master set status='Rejected' , reject_reason = :rejecReason where leave_id = :leaveId ", nativeQuery = true)
	public int updateRejectStatus(@Param("leaveId") String leaveId , @Param("rejecReason") String reject_reason)   ;
}
