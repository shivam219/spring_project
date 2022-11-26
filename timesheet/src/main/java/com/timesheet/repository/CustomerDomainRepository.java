package com.timesheet.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.timesheet.controller.CustomerDomain;

@Repository
public interface CustomerDomainRepository extends CrudRepository<CustomerDomain, Integer> {

}
