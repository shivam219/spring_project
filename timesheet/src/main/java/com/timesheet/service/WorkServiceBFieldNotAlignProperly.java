package com.timesheet.service;

import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.timesheet.model.Work;
import com.timesheet.repository.WorkRepository;

@Component
public class WorkServiceBFieldNotAlignProperly {

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
		System.out.println(l);
		LinkedHashMap<String, List<Work>> map = new LinkedHashMap<String, List<Work>>();
		for (Work w : l) {
			if (map.containsKey(w.getProjectName())) {
				ArrayList<Work> al = new ArrayList<Work>();
				al.addAll(map.get(w.getProjectName()));
				al.add(w);
				map.put(w.getProjectName(), al);

			} else {
				for (int j = 0; j < 1; j++) {
					int i = 1;
					if (w.getDay().equals("mon") && i == 1) {
						ArrayList<Work> al = new ArrayList<Work>();
						al.add(w);
						map.put(w.getProjectName(), al);
						break;
					} else {
						ArrayList<Work> al = new ArrayList<Work>();
						Work w2 = new Work();
						w2.setDay("");
						map.put(w.getProjectName(), al);
						i++;
					} // 1

					if (w.getDay().equals("tue") && i == 2) {
						ArrayList<Work> al = new ArrayList<Work>();
						Work w2 = new Work();
						w2.setDay("");
						map.put(w.getProjectName(), al);
						ArrayList<Work> al2 = (ArrayList<Work>) map.get(w.getProjectName());
						ArrayList<Work> al3 = (ArrayList<Work>) al2.stream().map(e -> {
							e.setProjectName(w.getProjectName());
							return e;
						}).collect(Collectors.toList());
						map.put(w.getProjectName(), al3);

						break;
					} else {
						ArrayList<Work> al = new ArrayList<Work>();
						Work w2 = new Work();
						w2.setDay("");
						map.put(w.getProjectName(), al);
						i++;
					} // 2
					if (w.getDay().equals("wed") && i == 3) {
						ArrayList<Work> al = new ArrayList<Work>();
						al.add(w);
						map.put(w.getProjectName(), al);
						ArrayList<Work> al2 = (ArrayList<Work>) map.get(w.getProjectName());
						ArrayList<Work> al3 = (ArrayList<Work>) al2.stream().map(e -> {
							e.setProjectName(w.getProjectName());
							return e;
						}).collect(Collectors.toList());
						map.put(w.getProjectName(), al3);
						break;
					} else {
						ArrayList<Work> al = new ArrayList<Work>();
						Work w2 = new Work();
						w2.setDay("");
						map.put(w.getProjectName(), al);
						i++;
					} // 3
					if (w.getDay().equals("thu") && i == 4) {
						ArrayList<Work> al = new ArrayList<Work>();
						al.add(w);
						map.put(w.getProjectName(), al);
						ArrayList<Work> al2 = (ArrayList<Work>) map.get(w.getProjectName());
						ArrayList<Work> al3 = (ArrayList<Work>) al2.stream().map(e -> {
							e.setProjectName(w.getProjectName());
							return e;
						}).collect(Collectors.toList());
						map.put(w.getProjectName(), al3);
						break;
					} else {
						ArrayList<Work> al = new ArrayList<Work>();
						Work w2 = new Work();
						w2.setDay("");
						map.put(w.getProjectName(), al);
						i++;
					} // 4
					if (w.getDay().equals("fri") && i == 5) {
						ArrayList<Work> al = new ArrayList<Work>();
						al.add(w);
						map.put(w.getProjectName(), al);
						ArrayList<Work> al2 = (ArrayList<Work>) map.get(w.getProjectName());
						ArrayList<Work> al3 = (ArrayList<Work>) al2.stream().map(e -> {
							e.setProjectName(w.getProjectName());
							return e;
						}).collect(Collectors.toList());
						map.put(w.getProjectName(), al3);
						break;
					} else {
						ArrayList<Work> al = new ArrayList<Work>();
						Work w2 = new Work();
						w2.setDay("");
						map.put(w.getProjectName(), al);
						i++;
					} // 5
					if (w.getDay().equals("sat") && i == 6) {
						ArrayList<Work> al = new ArrayList<Work>();
						al.add(w);
						map.put(w.getProjectName(), al);
						ArrayList<Work> al2 = (ArrayList<Work>) map.get(w.getProjectName());
						ArrayList<Work> al3 = (ArrayList<Work>) al2.stream().map(e -> {
							e.setProjectName(w.getProjectName());
							return e;
						}).collect(Collectors.toList());
						map.put(w.getProjectName(), al3);
						break;
					} else {
						ArrayList<Work> al = new ArrayList<Work>();
						Work w2 = new Work();
						w2.setDay("");
						map.put(w.getProjectName(), al);
						i++;
					} // 6
					if (w.getDay().equals("sun") && i == 7) {
						ArrayList<Work> al = new ArrayList<Work>();
						al.add(w);
						map.put(w.getProjectName(), al);
						ArrayList<Work> al2 = (ArrayList<Work>) map.get(w.getProjectName());
						ArrayList<Work> al3 = (ArrayList<Work>) al2.stream().map(e -> {
							e.setProjectName(w.getProjectName());
							return e;
						}).collect(Collectors.toList());
						map.put(w.getProjectName(), al3);
						break;
					} else {
						ArrayList<Work> al = new ArrayList<Work>();
						Work w2 = new Work();
						w2.setDay("");
						map.put(w.getProjectName(), al);
						i++;
					} // 7
				}
			}
		}
		for (Map.Entry<String, List<Work>> entry : map.entrySet()) {
			String key = entry.getKey();
			List<Work> val = entry.getValue();
			System.out.println(key);
			System.out.println(val);
		}
		System.out.println(map);
		return map;
	}
}