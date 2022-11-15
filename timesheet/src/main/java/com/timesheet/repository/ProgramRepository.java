package com.timesheet.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.timesheet.model.Program;

public interface ProgramRepository extends JpaRepository<Program, Integer> {


	@Query(value="select PRG_CODE, PRG_DESC from ess_program_master where PRG_PRNT is null order by PRG_DESC asc" ,nativeQuery = true)
	public List<String[]> findAllProgram();

	@Query(value="select  PRG_PRNT  , PRG_DESC  FROM ess_program_master" ,nativeQuery = true)
	public List<String[]> findAllProgramLink();

	@Query(value="SELECT PRG_DESC FROM timesheet.timesheet_program_master where prg_prnt = :prgPrnt" ,nativeQuery = true)
	public List<String> findAllProgramLinkByPrgPrnt(@Param("prgPrnt")String prgPrnt);
	
	
}
