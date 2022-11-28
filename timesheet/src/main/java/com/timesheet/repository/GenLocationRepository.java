package com.timesheet.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.timesheet.model.GenLocation;

@Repository
public interface GenLocationRepository extends JpaRepository<GenLocation, Long> {

	@Query(value = "SELECT * FROM timesheet_gen_locations where LOC_TYPE = 'S' order by LOC_DESC", nativeQuery = true)
	public List<GenLocation> findAllByState();

	@Query(value = "SELECT * FROM timesheet_gen_locations where LOC_TYPE = 'T' order by LOC_DESC ", nativeQuery = true)
	public List<GenLocation> findAllByTown();

	@Query(value = "SELECT * FROM timesheet_gen_locations where LOC_TYPE = 'C' order by LOC_DESC", nativeQuery = true)
	public List<GenLocation> findAllByCountry();

}
