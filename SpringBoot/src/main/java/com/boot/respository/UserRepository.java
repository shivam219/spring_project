package com.boot.respository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.boot.model.User;

public interface UserRepository extends CrudRepository<User, Integer> {

	public List<User> findByName(String name);
 }
