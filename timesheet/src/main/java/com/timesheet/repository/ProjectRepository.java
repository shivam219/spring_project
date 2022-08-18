package com.timesheet.repository;

import org.springframework.data.repository.CrudRepository;

import com.timesheet.model.Project;

public interface ProjectRepository extends CrudRepository<Project, Integer> {
	
}
