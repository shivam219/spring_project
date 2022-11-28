package com.timesheet.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.timesheet.model.DaySheet;

public interface DaySheetRepository extends CrudRepository<DaySheet, Integer> {
	@Query(value = "select * from timesheet_day_sheet where month_id = :monthId and date between :startDate  and  :endDate ", nativeQuery = true)
	public List<DaySheet> findByStartDateAndEndDateMonthId(@Param("startDate") String startDate,
			@Param("endDate") String endDate, @Param("monthId") Long monthId);
	
	@Query(value = "select * from timesheet_day_sheet where month_id  in( :monthId  , :monthId2 )  and date between :startDate  and  :endDate ", nativeQuery = true)
	public List<DaySheet> findByStartDateAndEndDateMonthId2(@Param("startDate") String startDate,
			@Param("endDate") String endDate, @Param("monthId") Long monthId , @Param("monthId2") Long monthId2);
	
	@Modifying
	@Transactional
	@Query(value = "delete from timesheet_day_sheet where month_id = :monthId and date between :startDate  and  :endDate ", nativeQuery = true)
	public int deleteByStartDateAndEndDateMonthId(@Param("startDate") String startDate,
			@Param("endDate") String endDate, @Param("monthId") Long monthId);
}
