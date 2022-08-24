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

	public List<Work> getWorByStartDateEndDate(String startDate, String endDate, long empId) {
		List<Work> l = repository.getWorByStartDateEndDate(startDate, endDate, empId);
		LinkedHashMap<Integer, List<Work>> map = new LinkedHashMap<Integer, List<Work>>();
		for (Work w : l) {
			if (map.containsKey(w.getProject())) {
				ArrayList<Work> al = new ArrayList<Work>();
				al.addAll(map.get(w.getProject()));
				al.add(w);
				map.put(w.getId(), al);

			} else {
				ArrayList<Work> al = new ArrayList<Work>();
				al.add(w);
				map.put(w.getId(), al);
			}
		}
		
		for (Map.Entry<Integer, List<Work>> entry : map.entrySet()) {
			Integer key = entry.getKey();
			List<Work> val = entry.getValue();
			System.out.println(key);
			System.out.println(val);
		}
		return l;
	}

}
