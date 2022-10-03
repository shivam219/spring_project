package com.timesheet.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.timesheet.model.WorkMaster;

@Repository
public interface WorkMasterRepository extends JpaRepository<WorkMaster, Long> {

}
