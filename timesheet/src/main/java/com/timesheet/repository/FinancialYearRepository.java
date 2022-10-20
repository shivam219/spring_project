package com.timesheet.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.timesheet.model.FinancialYear;


public interface FinancialYearRepository extends JpaRepository<FinancialYear, Integer>{
	
	

}
