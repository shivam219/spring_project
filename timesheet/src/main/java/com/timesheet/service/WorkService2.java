package com.timesheet.service;

import java.util.LinkedHashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.timesheet.model.Work2;
import com.timesheet.repository.WorkRepository2;

@Component
public class WorkService2 {

	@Autowired
	WorkRepository2 repository;
 
	public boolean saveAllWork(List<Work2> work2) {
		boolean isSave = false;
		try {
			List<Work2> list = (List<Work2>) repository.saveAll(work2);
			isSave = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return isSave;
	}

	public  List<Work2> getWorkByStartDateEndDate(String startDate, String endDate, long empId) {
		List<Work2> l = repository.getWorkByStartDateEndDate(startDate, endDate, empId);
		System.out.println(l);
		 
		return l;
	}
}
