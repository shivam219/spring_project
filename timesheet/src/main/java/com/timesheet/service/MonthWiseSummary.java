package com.timesheet.service;

import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;

import com.timesheet.config.UserPrincipal;
import com.timesheet.dto.EmployeeHourDto;
import com.timesheet.dto.ProjectEmpHour;
import com.timesheet.repository.ProjectRepository;

@Service
public class MonthWiseSummary {

	@Autowired
	ProjectRepository pr;

	public LinkedList<EmployeeHourDto> findEmployeeIdAndFromDateAndToDate(long empId, String fromDate, String toDate) {
		UserPrincipal user = (UserPrincipal) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		List<String[]> tu = null;
		if (user.getRole().equals("SuperAdmin")) {
			tu = pr.findEmployeeIdAndFromDateAndToDateByAdmin(fromDate, toDate);
		} else {
			tu = pr.findEmployeeIdAndFromDateAndToDate(empId, fromDate, toDate);
		}
		LinkedHashMap<String, Integer> map = new LinkedHashMap<>();

		LinkedList<EmployeeHourDto> ldto = new LinkedList<>();
		for (Iterator it = tu.iterator(); it.hasNext();) {
			String[] cur = (String[]) it.next();
			if (map.containsKey(cur[0])) {
				EmployeeHourDto inDto = ldto.get(ldto.size() - 1);
				ProjectEmpHour ind = new ProjectEmpHour();
				ind.setHour(cur[3]);
				ind.setName(cur[2]);
				ind.setHourPer(cur[4]);
				inDto.getPl().add(ind);
				map.put(cur[0], (map.get(cur[0]) + Integer.parseInt(cur[3])));
				inDto.setTotalHour(map.get(cur[0]));
			} else {
				map.put(cur[0], Integer.parseInt(cur[3]));
				EmployeeHourDto inDto = new EmployeeHourDto();
				inDto.setEmpName(cur[1]);
				ProjectEmpHour ind = new ProjectEmpHour();
				ind.setHour(cur[3]);
				ind.setName(cur[2]);
				ind.setHourPer(cur[4]);
				LinkedList<ProjectEmpHour> npl = new LinkedList<ProjectEmpHour>();
				npl.add(ind);
				inDto.setPl(npl);
				inDto.setTotalHour(Integer.parseInt(cur[3]));
				ldto.add(inDto);
			}
		}
		return ldto;
	}

}
