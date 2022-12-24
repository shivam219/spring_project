package com.timesheet.service;

import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.commons.collections4.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.timesheet.dto.DaySheetDto;
import com.timesheet.model.DaySheet;
import com.timesheet.model.MonthSheet;
import com.timesheet.model.Project;
import com.timesheet.model.User;
import com.timesheet.repository.DaySheetRepository;
import com.timesheet.repository.MonthSheetRepository;
import com.timesheet.repository.ProjectRepository;
import com.timesheet.repository.UserRepository;

@Component
public class DaySheetService {

	@Autowired
	DaySheetRepository dsr;
	@Autowired
	MonthSheetRepository msr;
	@Autowired
	UserRepository ur;

	@Autowired
	ProjectRepository pr;

	public Map<Integer, DaySheetDto> getDaySheetByStartDateAndEndDate(String startDate, String endDate, long empId) {
		String sd[] = startDate.split("-");
		String ed[] = endDate.split("-");
		User user = ur.findById(empId).get();
		MonthSheet monthSheet1 = msr.findByEmpId(empId, Integer.parseInt(sd[1]), Integer.parseInt(sd[0]));
		if (monthSheet1 == null) {
			monthSheet1 = new MonthSheet();
			monthSheet1.setUser(user);
			monthSheet1.setMonth(startDate);
			monthSheet1 = msr.save(monthSheet1);
		}
		MonthSheet monthSheet2 = msr.findByEmpId(empId, Integer.parseInt(ed[1]), Integer.parseInt(ed[0]));
		if (monthSheet2 == null) {
			monthSheet2 = new MonthSheet();
			monthSheet2.setUser(user);
			monthSheet2.setMonth(endDate);
			monthSheet2 = msr.save(monthSheet2);
		}
		List<DaySheet> dayList = new ArrayList<>();
		if(monthSheet1.getMonthSheetId()==monthSheet2.getMonthSheetId()) {
			dayList = dsr.findByStartDateAndEndDateMonthId(startDate, endDate,
					monthSheet1.getMonthSheetId());	
		}else if (monthSheet1.getMonthSheetId()!=monthSheet2.getMonthSheetId()) {
			dayList = dsr.findByStartDateAndEndDateMonthId2(startDate, endDate,
					monthSheet2.getMonthSheetId(), monthSheet1.getMonthSheetId());	
		}
		Collections.sort(dayList, (e1, e2) -> e1.getDate().compareTo(e2.getDate()));
		List<Project> pjtlist = user.getProject();
		Map<Integer, DaySheetDto> map = new HashedMap<Integer, DaySheetDto>();
		Map<Integer, List<DaySheet>> map2 = new HashedMap<Integer, List<DaySheet>>();
		
		// work for only mothSheet1 

		for (DaySheet w : dayList) {
			if (map2.containsKey(w.getProjectId())) {
				LocalDate t = LocalDate.parse(w.getDate(), DateTimeFormatter.ofPattern("yyyy-MM-dd"));
				DaySheet wl = map2.get(w.getProjectId()).get(map2.get(w.getProjectId()).size() - 1);// give last object
				// tue
				LocalDate d1 = LocalDate.parse(wl.getDate(), DateTimeFormatter.ofPattern("yyyy-MM-dd"));
				LocalDate d2 = LocalDate.parse(w.getDate(), DateTimeFormatter.ofPattern("yyyy-MM-dd"));
				int df = (int) (Period.between(d1, d2).getDays() - 1); // 22

				ArrayList<DaySheet> al = new ArrayList<DaySheet>();
				al.addAll(map2.get(w.getProjectId()));
				for (int i = df; i > 0; i--) {
					DaySheet ds2 = new DaySheet();
					ds2.setDaySheetId(0L);
					ds2.setMonthId(w.getMonthId());
					ds2.setProjectId(w.getProjectId());
					ds2.setDate(t.minusDays(i).toString());
					ds2.setHour(0);
					ds2.setDescr("");
					al.add(ds2);
				}
				al.add(w);
				map2.put(w.getProjectId(), al);

			} else {
				LocalDate t = LocalDate.parse(w.getDate(), DateTimeFormatter.ofPattern("yyyy-MM-dd"));
//				if (t.getDayOfWeek().toString().equals("MONDAY")) {
				if (t.getDayOfWeek().getValue() == 1) {
					ArrayList<DaySheet> al = new ArrayList<DaySheet>();
					al.add(w);
					map2.put(w.getProjectId(), al);
				} else if (t.getDayOfWeek().getValue() == 2) {
					DaySheet w2 = new DaySheet();
					w2.setDaySheetId(0L);
					w2.setProjectId(w.getProjectId());
					w2.setMonthId(w.getMonthId());
					w2.setDate(t.minusDays(1).toString());
					w2.setHour(0);
					w2.setDescr("");

					ArrayList<DaySheet> al = new ArrayList<DaySheet>();
					al.add(w2);
					al.add(w);
					map2.put(w.getProjectId(), al);
				} else if (t.getDayOfWeek().getValue() == 3) {
					ArrayList<DaySheet> al = new ArrayList<DaySheet>();
					for (int i = 2; i > 0; i--) {
						DaySheet w2 = new DaySheet();
						w2.setDaySheetId(0L);
						w2.setProjectId(w.getProjectId());
						w2.setMonthId(w.getMonthId());
						w2.setDate(t.minusDays(i).toString());
						w2.setHour(0);
						w2.setDescr("");
						al.add(w2);
					}
					al.add(w);
					map2.put(w.getProjectId(), al);
				} else if (t.getDayOfWeek().getValue() == 4) {
					ArrayList<DaySheet> al = new ArrayList<DaySheet>();
					for (int i = 3; i > 0; i--) {
						DaySheet w2 = new DaySheet();
						w2.setDaySheetId(0L);
						w2.setProjectId(w.getProjectId());
						w2.setMonthId(w.getMonthId());
						w2.setDate(t.minusDays(i).toString());
						w2.setHour(0);
						w2.setDescr("");
						al.add(w2);
					}
					al.add(w);
					map2.put(w.getProjectId(), al);
				} else if (t.getDayOfWeek().getValue() == 5) {
					ArrayList<DaySheet> al = new ArrayList<DaySheet>();
					for (int i = 4; i > 0; i--) {
						DaySheet w2 = new DaySheet();
						w2.setDaySheetId(0L);
						w2.setProjectId(w.getProjectId());
						w2.setMonthId(w.getMonthId());
						w2.setDate(t.minusDays(i).toString());
						w2.setHour(0);
						w2.setDescr("");
						al.add(w2);
					}
					al.add(w);
					map2.put(w.getProjectId(), al);
				} else if (t.getDayOfWeek().getValue() == 6) {
					ArrayList<DaySheet> al = new ArrayList<DaySheet>();
					for (int i = 5; i > 0; i--) {
						DaySheet w2 = new DaySheet();
						w2.setDaySheetId(0L);
						w2.setProjectId(w.getProjectId());
						w2.setMonthId(w.getMonthId());
						w2.setDate(t.minusDays(i).toString());
						w2.setHour(0);
						w2.setDescr("");
						al.add(w2);
					}
					al.add(w);
					map2.put(w.getProjectId(), al);
				} else if (t.getDayOfWeek().getValue() == 7) {
					ArrayList<DaySheet> al = new ArrayList<DaySheet>();
					for (int i = 6; i > 0; i--) {
						DaySheet w2 = new DaySheet();
						w2.setDaySheetId(0L);
						w2.setProjectId(w.getProjectId());
						w2.setMonthId(w.getMonthId());
						w2.setDate(t.minusDays(i).toString());
						w2.setHour(0);
						w2.setDescr("");
						al.add(w2);
					}
					al.add(w); // Adding last like one Sunday is enter so
					map2.put(w.getProjectId(), al);
				}
			}
		}
//		saving map2 data to map
		for (Map.Entry<Integer, List<DaySheet>> entry : map2.entrySet()) {
			Integer key = entry.getKey();
			List<DaySheet> value = entry.getValue();
			DaySheetDto dto = new DaySheetDto();
			dto.setDaysheet(value);
			Project project = pjtlist.stream().filter(e -> e.getProjectId() == key).findFirst().get();
			dto.setCustomerName(project.getCustomer().getCustomerName());
			dto.setProjectName(project.getProjectName());
			map.put(key, dto);
		}

//		fill last remain oobject
		for (Map.Entry<Integer, DaySheetDto> entry : map.entrySet()) {
			Integer key = entry.getKey();
			int len = entry.getValue().getDaysheet().size(); // 7 - 4 = 3
			DaySheet ds = entry.getValue().getDaysheet().get(entry.getValue().getDaysheet().size() - 1); // give last //
																											// // object
			LocalDate d1 = LocalDate.parse(ds.getDate(), DateTimeFormatter.ofPattern("yyyy-MM-dd")); /// 25
			ArrayList<DaySheet> dsl = new ArrayList<DaySheet>();
			dsl.addAll(entry.getValue().getDaysheet());
			for (int i = 1; i <= (7 - len); i++) {
				DaySheet w2 = new DaySheet();
				w2.setDaySheetId(0L);
				w2.setProjectId(ds.getProjectId());
				w2.setMonthId(ds.getMonthId());
				w2.setDate(d1.plusDays(i).toString());
				w2.setHour(0);
				w2.setDescr("");
				dsl.add(w2);
			}
			map.get(key).setDaysheet(dsl);// just change latest daysheet list
		}

//		it will fill blank data to all field data it present
		for (Project p : pjtlist) {
			if (map.containsKey(p.getProjectId())) {
			} else {
				LocalDate ld = LocalDate.parse(startDate, DateTimeFormatter.ofPattern("yyyy-MM-dd"));
				ArrayList<DaySheet> al = new ArrayList<DaySheet>();
				for (int i = 0; i < 7; i++) {
					DaySheet w2 = new DaySheet();
					w2.setDaySheetId(0L);
					w2.setProjectId(p.getProjectId());
					w2.setDate(ld.plusDays(i).toString());
					w2.setHour(0);
					w2.setDescr("DaySheet");
					w2.setMonthId(monthSheet1.getMonthSheetId());
					al.add(w2);
				}
				DaySheetDto dst2 = new DaySheetDto();
				dst2.setCustomerName(p.getCustomer().getCustomerName());
				dst2.setProjectName(p.getProjectName());
				dst2.setDaysheet(al);
				map.put(p.getProjectId(), dst2);
			}
		}
		if (monthSheet2.getMonthSheetId() != monthSheet1.getMonthSheetId()) {
			// put next month id
			for (Entry<Integer, DaySheetDto> entry : map.entrySet()) {
				DaySheetDto dst = entry.getValue();
				List<DaySheet> dsl = dst.getDaysheet();
				for (DaySheet d : dsl) {
					if(d.getMonth().equals(sd[1])) {
						 
					}else if (d.getMonth().equals(ed[1])) {
						d.setMonthId(monthSheet2.getMonthSheetId());
					}
				}

			}
		}

		return map;
	}

}
