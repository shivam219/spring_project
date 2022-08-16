package com.timesheet.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.timesheet.model.Work;
import com.timesheet.repository.WorkRepository;

@Component
public class WorkService {

	@Autowired
	WorkRepository repository;

	public boolean saveAllWork(List<Work> work) {
		boolean isSave =false;
		try {
			List<Work> list  = (List<Work>) repository.saveAll(work);
			isSave=true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return isSave;
	}
}
