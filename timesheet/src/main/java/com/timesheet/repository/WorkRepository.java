package com.timesheet.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Component;

import com.timesheet.model.Work;

@Component
public interface WorkRepository extends CrudRepository<Work, Integer>{
	
}
