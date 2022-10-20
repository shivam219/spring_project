package com.timesheet.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.event.TransactionalEventListener;

import com.timesheet.model.Leave;

public interface LeaveRepository extends CrudRepository<Leave, Long> {

	@Modifying
	@Query(value = "insert into leave_master (emp_id , emp_name, manager_name, manager_id, day_mode, leave_type, leave_reason, start_date, end_date, attachment ,status, reject_reason ,submitted_date) "
			+ "values (  :empid,  :empname,  :managername, :managerid, :daymode, :leavetype, :leavereason, :startdate, :enddate, :attachment, :status, :rejectreason , now());", nativeQuery = true)
	@Transactional
	public int saveLeave(@Param("empid") String empid, @Param("empname") String empname,
			@Param("managername") String managername, @Param("managerid") String managerid,
			@Param("daymode") String daymode, @Param("leavetype") String leavetype,
			@Param("leavereason") String leavereason, @Param("startdate") String startdate,
			@Param("enddate") String enddate, @Param("attachment") String attachment, @Param("status") String status,
			@Param("rejectreason") String rejectreason);

	@Query(value = "select leave_id from leave_master order by leave_code desc limit 1 ", nativeQuery = true)
	public String getLeaveId();

	@Query(value = "select * from leave_master where emp_id = :empId and start_date >= curdate() and status in ('Pending','Approved')  order by leave_id asc", nativeQuery = true)
	public List<Leave> getCancleLeave(@Param("empId") String empId);

	@Modifying
	@Transactional
	@Query(value = "update leave_master set status = 'Cancelled'  where leave_id = :leaveId", nativeQuery = true)
	public int updateCancleStatus(@Param("leaveId") String leaveId);

	@Query(value = "select  *  from leave_master where month(start_date) = :month and year(start_date) = :year and status in ('Approved') ", nativeQuery = true)
	public List<Leave> getLeaveByMonthAndYear(@Param("month") String month, @Param("year") String year);

	@Query(value = "SELECT count(status) FROM ess.leave_master where status='Approved' and month(start_date)=month(now())", nativeQuery = true)
	public Integer getApprovedCountOfMonth();

	@Query(value = "SELECT count(status) FROM ess.leave_master where status='Cancelled' and month(start_date)=month(now())", nativeQuery = true)
	public Integer getCancelledCountOfMonth();
	
	@Query(value = "SELECT count(status) FROM ess.leave_master where status='Pending' and month(start_date)=month(now())", nativeQuery = true)
	public Integer getPendingCountOfMonth();

	@Query(value = "SELECT count(status) FROM ess.leave_master where status='Rejected' and month(start_date)=month(now())", nativeQuery = true)
	public Integer getRejectedCountOfMonth();
}
