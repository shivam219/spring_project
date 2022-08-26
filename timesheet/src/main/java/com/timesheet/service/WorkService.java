package com.timesheet.service;

import java.util.ArrayList;
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
		LinkedHashMap<String, List<Work>> map = new LinkedHashMap<String, List<Work>>();
		for (Work w : l) {
			if (map.containsKey(w.getProjectName())) {
				ArrayList<Work> al = new ArrayList<Work>();
				al.addAll(map.get(w.getProjectName()));
				al.add(w);
				map.put(w.getProjectName(), al);
			} else {
				ArrayList<Work> al = new ArrayList<Work>();
				al.add(w);
				map.put(w.getProjectName(), al);
			}

		}
		for (Map.Entry<String, List<Work>> entry : map.entrySet()) {
			String key = entry.getKey();
			List<Work> val = entry.getValue();
			entry.getValue().get(0).getDay();
			System.out.println(key);
			System.out.println(val);
		}
		return map;
	}
}
