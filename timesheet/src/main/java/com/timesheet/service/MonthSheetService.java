package com.timesheet.service;

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.Collectors;
import java.util.stream.Stream;

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
		List<MonthSheetDto> ud = tu
				.stream().map(m -> new MonthSheetDto(m.get(0, BigInteger.class), m.get(1, String.class),
						m.get(2, String.class), m.get(3, BigInteger.class), m.get(4, BigInteger.class)))
				.collect(Collectors.toList());
		return ud;
	}

	public List<MonthSheetDataDto> findMonthSheetDataAndApprove(long monthId) {
		List<Tuple> tu = msr.findMonthSheetDataAndApprove2(monthId);
		List<MonthSheetDataDto> ud = tu.stream().map(m -> new MonthSheetDataDto(m.get(0, String.class),
				m.get(1, String.class), m.get(2, String.class), m.get(3, Integer.class))).collect(Collectors.toList());
		Set<String> set = new HashSet<>();
		List<MonthSheetDataDto> ud2 = new ArrayList<>();
		int size = 0;
		int hour = 0;
		int hours = 0;
		if (ud.size() > 0) {
			hour = Integer.valueOf(ud.get(0).getHour());
			hours = Integer.valueOf(ud.get(0).getHour());
			set.add(ud.get(0).getDate());
			ud2.add(ud.get(0));
			for (int i = 1; i < ud.size(); i++) {
				if (set.contains(ud.get(i).getDate())) {
					size = ud2.size() - 1;
					String ud2Pn = ud2.get(size).getProjectName();
					String udPn = ud.get(i).getProjectName();

					String ud2Desc = ud2.get(size).getDescr();
					String udDesc = ud.get(i).getDescr();

					String ud2Hour = ud2.get(size).getHour();
					String udHour = ud.get(i).getHour();
					hours = hours + Integer.parseInt(ud.get(i).getHour());
					ud2.get(size).setProjectName(ud2Pn + " <br> " + udPn);
					ud2.get(size).setDescr(ud2Desc + " <br> " + udDesc);
					ud2.get(size).setHour(ud2Hour + " <br> " + udHour);

				} else {
					if (hour != hours) {
						String oldHour = ud2.get(size).getHour();
						ud2.get(size).setHour(oldHour + "<br><b>" + hours + "</br></b>");
					}
					ud2.add(ud.get(i));
					set.add(ud.get(i).getDate());
					hour = Integer.valueOf(ud.get(i).getHour());
					hours = Integer.valueOf(ud.get(i).getHour());
				}
			}
		}
		return ud2;
	}

//	ajax data
	public List<MonthSheetDataDto> findMonthSheetDataAndApproveajax(long monthId) {
		List<Tuple> tu = msr.findMonthSheetDataAndApprove2(monthId);
		List<MonthSheetDataDto> ud = tu.stream().map(m -> new MonthSheetDataDto(m.get(0, String.class),
				m.get(1, String.class), m.get(2, String.class), m.get(3, Integer.class))).collect(Collectors.toList());
		return ud;
	}

	public List<MonthSheetDto> findMonthSheetEmployeeDataByMonthId(long monthId) {
		List<Tuple> tu = msr.findMonthSheetEmployeeDataByMonthId(monthId);
		List<MonthSheetDto> ud = tu
				.stream().map(m -> new MonthSheetDto(m.get(0, BigInteger.class), m.get(1, String.class),
						m.get(2, String.class), m.get(3, BigInteger.class), m.get(4, BigInteger.class)))
				.collect(Collectors.toList());
		return ud;
	}

	public List<EmployeeMonthChartDto> findMonthSheetEmployeeChart(long monthId) {
		List<Tuple> tu = msr.findMonthSheetEmployeeChart(monthId);
		List<EmployeeMonthChartDto> ud = tu.stream()
				.map(m -> new EmployeeMonthChartDto(m.get(0, BigInteger.class), m.get(1, String.class)

				)).collect(Collectors.toList());
		return ud;
	}

}
