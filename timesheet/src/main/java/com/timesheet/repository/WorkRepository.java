package com.timesheet.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Component;

import com.timesheet.model.Project;
import com.timesheet.model.Work;

@Component
public interface WorkRepository extends CrudRepository<Work, Integer> {

	@Query(value = "SELECT e.id,  e.emp_id , e.project_id, p.project_name, e.day , e.descr , e.hours,  e.day  FROM timesheet_work e inner join timesheet_project_master p on  e.project_id = p.project_id   where  e.emp_id = :empId  and day between :startDate  and  :endDate ", nativeQuery = true)
	public List<Work> getWorByStartDateEndDate(@Param("startDate") String startDate, @Param("endDate") String endDate,
			@Param("empId") long empId);
}
