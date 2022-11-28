package com.timesheet.service;

import java.math.BigInteger;
import java.util.List;
import java.util.stream.Collectors;

import javax.persistence.Tuple;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.timesheet.dto.UserDto;
import com.timesheet.repository.UserRepository;

@Component
public class UserMasterService {

	@Autowired
	UserRepository ur;

	public List<UserDto> findEmpNameManagerNameEmpGroupDesc() {
		List<Tuple> tu = ur.findEmpNameManagerNameEmpGroupDesc();
		List<UserDto> ud = tu.stream().
				map(m->new UserDto(
						m.get(0,BigInteger.class),
						m.get(1,String.class),
						m.get(2,String.class),
						m.get(3,String.class),
						m.get(4,String.class),
						m.get(5,String.class)
						))
						 .collect(Collectors.toList());		
		return ud;
	}
	public List<UserDto> findEmpNameManagerNameEmpGroupDescByEmpId(long empId) {
		List<Tuple> tu = ur.findEmpNameManagerNameEmpGroupDescByEmpId(empId);
		List<UserDto> ud = tu.stream().
				map(m->new UserDto(
						m.get(0,BigInteger.class),
						m.get(1,String.class),
						m.get(2,String.class)
						))
				.collect(Collectors.toList());		
		return ud;
	}
}
