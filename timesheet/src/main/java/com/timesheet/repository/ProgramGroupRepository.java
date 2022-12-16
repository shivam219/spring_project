package com.timesheet.repository;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.timesheet.model.ProgramGroup;

@Repository
public interface ProgramGroupRepository extends JpaRepository<ProgramGroup, Integer> {
//	error while
//No EntityManager with actual transaction available for current thread - cannot reliably process 'remove' call; nested exception is javax.persistence.TransactionRequiredException: No EntityManager with actual transaction available for current thread - cannot reliably process 'remove' call] with root cause
	int deleteByUgrpCode(Integer ugrpCode);

	@Transactional
	@Modifying
	@Query(value = "delete from timesheet_program_groupwise where UGRP_CODE = :ugrpCode",nativeQuery = true)
	int deleteByUgrpCodeNative(Integer ugrpCode);

}
