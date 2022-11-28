package com.timesheet.service;

import java.math.BigInteger;
import java.util.List;
import java.util.stream.Collectors;

import javax.persistence.Tuple;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.timesheet.dto.EmployeeMonthChartDto;
import com.timesheet.dto.MonthSheetDataDto;
import com.timesheet.dto.MonthSheetDto;
import com.timesheet.repository.MonthSheetRepository;

@Component
public class MonthSheetService {

	@Autowired
	MonthSheetRepository msr;

	public List<MonthSheetDto> findMonthSheetAndSubmit(long managerId) {
		List<Tuple> tu = msr.findMonthSheetAndSubmit(managerId);
		List<MonthSheetDto> ud = tu.stream().
				map(m->new MonthSheetDto(
						m.get(0,BigInteger.class),
						m.get(1,String.class),
						m.get(2,String.class),
						m.get(3,BigInteger.class),
						m.get(4,BigInteger.class)
						))
						 .collect(Collectors.toList());		
		return ud;
	}
	public List<MonthSheetDataDto> findMonthSheetDataAndApprove(long monthId) {
		List<Tuple> tu = msr.findMonthSheetDataAndApprove(monthId);
		List<MonthSheetDataDto> ud = tu.stream().
				map(m->new MonthSheetDataDto(
						m.get(0,String.class),
						m.get(1,String.class),
						m.get(2,String.class),
						m.get(3,Integer.class)
						))
				.collect(Collectors.toList());		
		return ud;
	}
	public List<MonthSheetDto> findMonthSheetEmployeeDataByMonthId(long monthId) {
		List<Tuple> tu = msr.findMonthSheetEmployeeDataByMonthId(monthId);
		List<MonthSheetDto> ud = tu.stream().
				map(m->new MonthSheetDto(
						m.get(0,BigInteger.class),
						m.get(1,String.class),
						m.get(2,String.class),
						m.get(3,BigInteger.class),
						m.get(4,BigInteger.class)
						))
				.collect(Collectors.toList());		
		return ud;
	}
	public List<EmployeeMonthChartDto> findMonthSheetEmployeeChart(long monthId) {
		List<Tuple> tu = msr.findMonthSheetEmployeeChart(monthId);
		List<EmployeeMonthChartDto> ud = tu.stream().
				map(m->new EmployeeMonthChartDto(
						m.get(0,BigInteger.class),
						m.get(1,String.class)
						 
						))
				.collect(Collectors.toList());	 
		return ud;
	}

}
