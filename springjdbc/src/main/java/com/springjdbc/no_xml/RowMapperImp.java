package com.springjdbc.no_xml;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class RowMapperImp implements RowMapper<Student> {

	public Student mapRow(ResultSet rs, int rowNum) throws SQLException {
		System.out.println(rs);
		Student student = new Student();
		student.setId(rs.getInt(1));
		student.setCity(rs.getString(2));
		student.setName(rs.getString(3));
		return student;
	}

}
