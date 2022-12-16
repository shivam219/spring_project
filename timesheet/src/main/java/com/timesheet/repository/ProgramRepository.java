package com.timesheet.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.timesheet.model.Program;

public interface ProgramRepository extends JpaRepository<Program, Integer> {

	@Query(value = "select PRG_CODE, PRG_DESC from timesheet_program_master where PRG_NAME = '#' ", nativeQuery = true)
	public List<String[]> findAllProgram2();
	@Query(value = "select PRG_CODE, PRG_DESC from timesheet_program_master where PRG_PRNT is null ", nativeQuery = true)
	public List<String[]> findAllProgram();

	@Query(value = "select PRG_PRNT, PRG_DESC,  PRG_CODE  FROM timesheet_program_master", nativeQuery = true)
	public List<String[]> findAllProgramLink();

	@Query(value = "select PRG_CODE, PRG_DESC , PRG_NAME ,PRG_ORDER from timesheet_program_master where  PRG_PRNT = :prgPrnt", nativeQuery = true)
	public List<String[]> findAllProgramLinkByPrgPrnt(int prgPrnt);

}
