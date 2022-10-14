package com.timesheet.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.timesheet.model.UserGroup;

public interface UserGroupRepository extends JpaRepository<UserGroup, Integer> {

}
