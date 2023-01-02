package com.timesheet.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import com.timesheet.dto.YearDto;
import com.timesheet.model.FinancialYear;

//public interface FinancialYearRepository extends PagingAndSortingRepository<FinancialYear, Integer> {
/*
 * jpa find all return iterable
 */
//public interface FinancialYearRepository extends JpaSpecificationExecutor<FinancialYear> {

/*
 * jpa find all return list
 */
public interface FinancialYearRepository extends JpaRepository<FinancialYear, Integer> {
//		/*
//		 * jpa find all return list
//		 */

	@Modifying
	@Query(value = "update timesheet_financial_year set year_code =  :yearCode , year_desc = :yearCode , modified_by = :empId , modify_time = now(2) where  year_code =  :yearDesc  ", nativeQuery = true)
	@Transactional
	public int updateFinancialYear(int yearCode, String empId, String yearDesc);

//	@Query(value = "select year_code from timesheet_financial_year ", nativeQuery = true)
//	public List<Leave> findYearCode();

	@Query(name = "find_year_desc", nativeQuery = true)
	List<YearDto> findYearDesc();

}
