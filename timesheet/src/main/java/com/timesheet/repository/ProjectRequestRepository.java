package com.timesheet.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.timesheet.model.ProjectRequest;

@Repository
public interface ProjectRequestRepository extends JpaRepository<ProjectRequest, Long>{

	public List<ProjectRequest> findAllByEmpId(Long empId);
}
