package com.timesheet.repository;


import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import com.timesheet.model.Holiday;

public interface HolidayRepository extends JpaRepository<Holiday, Integer> {

	
	@Query(value = "select concat(date_format(h_date,'%D %b' ),', ',concat(description)) as Holidays FROM ess_holiday_master where month(h_date)=month(now()) and year(h_date)=year(now()) ORDER BY DATE(h_date) ASC ", nativeQuery = true)
	public List<Object> getHolidays(@Param("year") String year, @Param("month") String month);
	
	@Query(value ="select concat(date_format(h_date,'%D %b' ),', ',concat(description)) as Holidays FROM ess_holiday_master where h_date between :startDate and  :endDate ORDER BY DATE(h_date) ASC ", nativeQuery = true)
	public List<Object> getWeekHoliday(@Param("startDate") String year, @Param("endDate") String month);
	
	
	
	@Query(value =" select day(h_date) as m FROM ess_holiday_master  where h_date between :startDate and  :endDate ORDER BY DATE(h_date) ASC ",nativeQuery = true)
	public List<Integer> getWeekHolidays(@Param("startDate") String startDate, @Param("endDate") String endDate);
	
	
	
}

