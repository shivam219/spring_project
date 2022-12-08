package com.timesheet.repository;

import java.util.List;

import javax.persistence.Tuple;
import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.timesheet.model.Leave;

public interface LeaveRepository extends CrudRepository<Leave, Long> {

	@Modifying
	@Query(value = "insert into timesheet_leave_master (emp_id , emp_name, manager_name, manager_id, day_mode, leave_type, leave_reason, start_date, end_date, attachment ,status, reject_reason ,submitted_date) "
			+ "values (  :empid,  :empname,  :managername, :managerid, :daymode, :leavetype, :leavereason, :startdate, :enddate, :attachment, :status, :rejectreason , now());", nativeQuery = true)
	@Transactional
	public int saveLeave(@Param("empid") Long empid, @Param("empname") String empname,
			@Param("managername") String managername, @Param("managerid") Long managerid,
			@Param("daymode") String daymode, @Param("leavetype") String leavetype,
			@Param("leavereason") String leavereason, @Param("startdate") String startdate,
			@Param("enddate") String enddate, @Param("attachment") String attachment, @Param("status") String status,
			@Param("rejectreason") String rejectreason);

	@Query(value = "select leave_id from timesheet_leave_master order by leave_code desc limit 1 ", nativeQuery = true)
	public String getLeaveId();

	@Query(value = "select * from timesheet_leave_master where emp_id = :empId and start_date >= curdate() and second_status in ('Pending','Approved')  order by leave_id asc", nativeQuery = true)
	public List<Leave> getCancleLeaveByEmpId(@Param("empId") long empId);

	@Modifying
	@Transactional
	@Query(value = "update timesheet_leave_master set status = 'Cancelled' , second_status = 'Cancelled'  where leave_id = :leaveId", nativeQuery = true)
	public int updateCancleStatus(@Param("leaveId") String leaveId);

	@Query(value = "select  *  from timesheet_leave_master where month(start_date) = :month and year(start_date) = :year and status in ('Approved') ", nativeQuery = true)
	public List<Leave> getLeaveByMonthAndYear(@Param("month") String month, @Param("year") String year);

	@Query(value = "SELECT count(status) FROM ess.timesheet_leave_master where status='Approved' and month(start_date)=month(now()) and emp_id = :empId", nativeQuery = true)
	public Integer getApprovedCountOfMonth(long empId);

	@Query(value = "SELECT count(status) FROM ess.timesheet_leave_master where status='Cancelled' and month(start_date)=month(now()) and emp_id = :empId", nativeQuery = true)
	public Integer getCancelledCountOfMonth(long empId);

	@Query(value = "SELECT count(status) FROM ess.timesheet_leave_master where status='Pending' and month(start_date)=month(now()) and emp_id = :empId", nativeQuery = true)
	public Integer getPendingCountOfMonth(long empId);

	@Query(value = "SELECT count(status) FROM ess.timesheet_leave_master where status='Rejected' and month(start_date)=month(now()) and emp_id = :empId", nativeQuery = true)
	public Integer getRejectedCountOfMonth(long empId);

	@Query(value = "select leave_type, date_format(start_date,'%D %M %Y' ) as start_date, date_format(end_date,'%D %M %Y' ) as end_date, status, a.*  from timesheet_leave_master a", nativeQuery = true)
	public List<Leave> getLeaveStatus();

	@Query(value = "select  *  from timesheet_leave_master where month(start_date) = :month and year(start_date) = :year and status = :status and emp_id = :empId", nativeQuery = true)
	public List<Leave> getEmploeeWiseReport(@Param("month") String month, @Param("year") String year,
			@Param("empId") long empId, @Param("status") String status);

	@Query(value = "select  *  from timesheet_leave_master where month(start_date) = :month and year(start_date) = :year and status in ('Pending') ", nativeQuery = true)
	public List<Leave> getPendingLeaveByMonthAndYear(@Param("month") String month, @Param("year") String year);

	@Query(value = "select concat(date_format(start_date,'%D %b' ), ' to ', date_format(end_date,'%D %b' ),  ', ',concat(leave_type)) as Leaves FROM timesheet_leave_master where start_date between :startDate and  :endDate  ORDER BY DATE(start_date) ASC ", nativeQuery = true)
	public List<Object> getWeekLeaves(@Param("startDate") String year, @Param("endDate") String month);

	@Query(value = "SELECT leave_code,approve_reason,attachment,day_mode,emp_id,emp_name,end_date,  ifnull(leave_id , concat('L' ,LPAD( (:leaveCode) ,9,'0'))) as leave_id ,leave_manager_id,leave_reason,leave_type,manager_id,manager_name,reject_reason,second_approve_reason,second_status,start_date,status,submitted_date\n"
			+ "FROM timesheet_leave_master where leave_code = :leaveCode", nativeQuery = true)
	public Leave findByLeaveCode(@Param("leaveCode") long leaveCode);

	@Query(value = "select * from timesheet_leave_master where leave_id = :leaveId", nativeQuery = true)
	public Leave findByLeaveId(@Param("leaveId") String leaveId);

	public boolean existsByEmpIdAndStartDate(Long empId, String startDate);

	public Leave findByEmpIdAndLeaveId(Long empId, String leaveId);

	@Query(value = "SELECT leave_type , date_format(start_date,' %D %b' ) as start_date ,\n"
			+ "date_format(end_date,' %D %b' ) as end_date  , convert((datediff(end_date , start_date)+1),char) as days "
			+ "FROM ess.timesheet_leave_master where emp_id = :empId and second_status= 'Approved' ;\n"
			+ "\n"
			+ "", nativeQuery = true)
	public List<Tuple> findLeaveTypeStartDateEndDateByEmpId(@Param("empId") long empId);

}