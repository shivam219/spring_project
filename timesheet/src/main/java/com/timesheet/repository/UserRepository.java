package com.timesheet.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.timesheet.model.User;

public interface UserRepository extends JpaRepository<User, Long> {

	
}
