package com.timesheet.service;

import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.timesheet.model.Work;
import com.timesheet.repository.WorkRepository;

@Component
public class WorkService {

	@Autowired
	WorkRepository repository;

	public boolean saveAllWork(List<Work> work) {
		boolean isSave = false;
		try {
			List<Work> list = (List<Work>) repository.saveAll(work);
			isSave = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return isSave;
	}

	public LinkedHashMap<String, List<Work>> getWorByStartDateEndDate(String startDate, String endDate, long empId) {
		List<Work> l = repository.getWorByStartDateEndDate(startDate, endDate, empId);
		Collections.sort(l, (e1, e2) -> e1.getDay().compareTo(e2.getDay()));

		LinkedHashMap<String, List<Work>> map = new LinkedHashMap<String, List<Work>>();
		for (Work w : l) {
			if (map.containsKey(w.getProjectName())) {
				LocalDate t = LocalDate.parse(w.getDay(), DateTimeFormatter.ofPattern("yyyy-MM-dd"));
				Work wl = map.get(w.getProjectName()).get(map.get(w.getProjectName()).size() - 1);// give last object
																									// like tue
				LocalDate d1 = LocalDate.parse(wl.getDay(), DateTimeFormatter.ofPattern("yyyy-MM-dd"));
				LocalDate d2 = LocalDate.parse(w.getDay(), DateTimeFormatter.ofPattern("yyyy-MM-dd"));
				int df = (int) (Period.between(d1, d2).getDays() - 1); // 22

				ArrayList<Work> al = new ArrayList<Work>();
				al.addAll(map.get(w.getProjectName()));
				for (int i = df; i > 0; i--) {
					Work w2 = new Work();
					w2.setId(w.getId());
					w2.setEmpId(w.getEmpId());
					w2.setProjectId(w.getProjectId());
					w2.setProjectName(w.getProjectName());
					w2.setDay(t.minusDays(i).toString());
					w2.setHours("");
					w2.setDescr("");
					al.add(w2);
				}
				al.add(w);
				map.put(w.getProjectName(), al);

			} else {
				LocalDate t = LocalDate.parse(w.getDay(), DateTimeFormatter.ofPattern("yyyy-MM-dd"));
				if (t.getDayOfWeek().toString().equals("MONDAY")) {
					ArrayList<Work> al = new ArrayList<Work>();
					al.add(w);
					map.put(w.getProjectName(), al);
				} else if (t.getDayOfWeek().toString().equals("TUESDAY")) {
					Work w2 = new Work();
					w2.setId(w.getId());
					w2.setEmpId(w.getEmpId());
					w2.setProjectId(w.getProjectId());
					w2.setProjectName(w.getProjectName());
					w2.setDay(t.minusDays(1).toString());
					w2.setHours("");
					w2.setDescr("");
					ArrayList<Work> al = new ArrayList<Work>();
					al.add(w2);
					al.add(w);
					map.put(w.getProjectName(), al);

				} else if (t.getDayOfWeek().toString().equals("WEDNESDAY")) {
					ArrayList<Work> al = new ArrayList<Work>();
					for (int i = 2; i > 0; i--) {
						Work w2 = new Work();
						w2.setId(w.getId());
						w2.setEmpId(w.getEmpId());
						w2.setProjectId(w.getProjectId());
						w2.setProjectName(w.getProjectName());
						w2.setDay(t.minusDays(i).toString());
						w2.setHours("");
						w2.setDescr("");
						al.add(w2);
					}
					al.add(w);
					map.put(w.getProjectName(), al);
				} else if (t.getDayOfWeek().toString().equals("THURSDAY")) {
					ArrayList<Work> al = new ArrayList<Work>();
					for (int i = 3; i > 0; i--) {
						Work w2 = new Work();
						w2.setId(w.getId());
						w2.setEmpId(w.getEmpId());
						w2.setProjectId(w.getProjectId());
						w2.setProjectName(w.getProjectName());
						w2.setDay(t.minusDays(i).toString());
						w2.setHours("");
						w2.setDescr("");
						al.add(w2);
					}
					al.add(w);
					map.put(w.getProjectName(), al);
				} else if (t.getDayOfWeek().toString().equals("FRIDAY")) {
					ArrayList<Work> al = new ArrayList<Work>();
					for (int i = 4; i > 0; i--) {
						Work w2 = new Work();
						w2.setId(w.getId());
						w2.setEmpId(w.getEmpId());
						w2.setProjectId(w.getProjectId());
						w2.setProjectName(w.getProjectName());
						w2.setDay(t.minusDays(i).toString());
						w2.setHours("");
						w2.setDescr("");
						al.add(w2);
					}
					al.add(w);
					map.put(w.getProjectName(), al);
				} else if (t.getDayOfWeek().toString().equals("SATDAY")) {
					ArrayList<Work> al = new ArrayList<Work>();
					for (int i = 5; i > 0; i--) {
						Work w2 = new Work();
						w2.setId(w.getId());
						w2.setEmpId(w.getEmpId());
						w2.setProjectId(w.getProjectId());
						w2.setProjectName(w.getProjectName());
						w2.setDay(t.minusDays(i).toString());
						w2.setHours("");
						w2.setDescr("");
						al.add(w2);
					}
					al.add(w);
					map.put(w.getProjectName(), al);
				} else if (t.getDayOfWeek().toString().equals("SUNDAY")) {
					ArrayList<Work> al = new ArrayList<Work>();
					for (int i = 6; i > 0; i--) {
						Work w2 = new Work();
						w2.setId(w.getId());
						w2.setEmpId(w.getEmpId());
						w2.setProjectId(w.getProjectId());
						w2.setProjectName(w.getProjectName());
						w2.setDay(t.minusDays(i).toString());
						w2.setHours("");
						w2.setDescr("");
						al.add(w2);
					}
					al.add(w);
					map.put(w.getProjectName(), al);
				}

			}

		}
		for (Map.Entry<String, List<Work>> entry : map.entrySet()) {
			String key = entry.getKey(); 
			int len = entry.getValue().size(); //  7 - 4 = 3
			Work wl =  entry.getValue().get(entry.getValue().size()-1); // give last object
			LocalDate d1 = LocalDate.parse(wl.getDay(), DateTimeFormatter.ofPattern("yyyy-MM-dd")); /// 25 
			ArrayList<Work> al = new ArrayList<Work>();
			al.addAll(entry.getValue());
			for (int i = 1 ; i <= (7- len); i++) {
				Work w2 = new Work();
				w2.setId(wl.getId());
				w2.setEmpId(wl.getEmpId());
				w2.setProjectId(wl.getProjectId());
				w2.setProjectName(wl.getProjectName());
				w2.setDay(d1.plusDays(i).toString());
				w2.setHours("");
				w2.setDescr("");
				al.add(w2);
			}
			map.put(key, al);
		}
		for (Map.Entry<String, List<Work>> entry : map.entrySet()) {
			String key = entry.getKey();
			List<Work> val = entry.getValue();
			System.out.println(key);
			System.out.println(val);
		}
		return map;
	}
}
