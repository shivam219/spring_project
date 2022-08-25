package com.timesheet.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Component;

import com.timesheet.model.Work;
import com.timesheet.model.Work2;

@Component
public interface WorkRepository2 extends CrudRepository<Work2, Integer> {

	@Query(value = "SELECT e.id,  e.emp_id , e.project_id, p.project_name, e.wdate ,  e.status, e.mon, e.mon_des , e.tue, e.tue_des , e.wed, e.wed_des , e.thu, e.thu_des , e.fri, e.fri_des , e.sat, e.sat_des , e.sun, e.sun_des  FROM ess_work2 e INNER JOIN ess_project p ON  e.project_id = p.project_id WHERE   where  e.emp_id = :empId  and wdate between :startDate  and  :endDate     ", nativeQuery = true)
	public List<Work2> getWorkByStartDateEndDate(@Param("startDate") String startDate, @Param("endDate") String endDate,
			@Param("empId") long empId);
	@Query(value = "SELECT * from   ess_work2  ", nativeQuery = true)
	public List<Work2> getWorkByStartDateEndDate2(@Param("startDate") String startDate, @Param("endDate") String endDate,
			@Param("empId") long empId);
}
