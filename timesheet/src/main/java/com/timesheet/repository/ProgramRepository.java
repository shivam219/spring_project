package com.timesheet.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.timesheet.model.Program;

public interface ProgramRepository extends CrudRepository<Program, Integer> {

	@Query(value = "select PRG_CODE, PRG_DESC , isGroupExits(PRG_CODE, :ugrpCode)  from timesheet_program_master where PRG_NAME = '#' ", nativeQuery = true)
	public List<String[]> findAllProgram2(@Param("ugrpCode") int ugrpCode);

	@Query(value = "select PRG_CODE, PRG_DESC from timesheet_program_master where PRG_NAME = '#' ", nativeQuery = true)
	public List<String[]> findAllProgramIncludeSub();

	@Query(value = "select PRG_CODE, PRG_DESC from timesheet_program_master where PRG_PRNT is null ", nativeQuery = true)
	public List<String[]> findAllProgram();

	@Query(value = "select PRG_PRNT, PRG_DESC,  PRG_CODE  FROM timesheet_program_master", nativeQuery = true)
	public List<String[]> findAllProgramLink();

	@Query(value = "select PRG_PRNT, PRG_DESC,  PRG_CODE , isGroupExits(PRG_CODE, :ugrpCode)  FROM timesheet_program_master", nativeQuery = true)
	public List<String[]> findAllProgramLinkEdit(@Param("ugrpCode") int ugrpCode);

	@Query(value = "select PRG_CODE, PRG_DESC , PRG_NAME ,PRG_ORDER from timesheet_program_master where  PRG_PRNT = :prgPrnt", nativeQuery = true)
	public List<String[]> findAllProgramLinkByPrgPrnt(int prgPrnt);

	@Query(value = "select PRG_CODE , PRG_ORDER from timesheet_program_master where PRG_PRNT = :prgPrnt order by PRG_CODE desc limit  1", nativeQuery = true)
	public List<Integer[]> findLastPrgcodeAndPrgOrder(int prgPrnt);

}
