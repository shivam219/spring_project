package com.timesheet.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.timesheet.model.UserGroup;

public interface UserGroupRepository extends JpaRepository<UserGroup, Integer> {

	@Query(value = "select * from timesheet_user_group_master where  UGRP_CODE in (select UGRP_CODE from timesheet_program_groupwise group by  UGRP_CODE)", nativeQuery = true)
	public List<UserGroup> findAllMappedGroup();

	@Query(value = "select *  from timesheet_user_group_master where  UGRP_CODE not in (select UGRP_CODE from timesheet_program_groupwise group by  UGRP_CODE)", nativeQuery = true)
	public List<UserGroup> findAllNotMappedGroup();
	
//	@Query(value = "select *  from timesheet_user_group_master where  UGRP_CODE not in (select UGRP_CODE from timesheet_program_groupwise group by  UGRP_CODE)", nativeQuery = true)
	public UserGroup findByUgrpCode(int ugrpCode );

}
