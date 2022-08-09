package com.springjdbc.dao;

import java.util.List;

import com.springjdbc.entities.Student;

public interface StudentDao {
	public  int insert(Student  student);
	public  int change(Student  student);
	public  int delete(Student  student);
	public  Student get(int studentId);
	public  List<Student> getAllStudents( );
	
}
