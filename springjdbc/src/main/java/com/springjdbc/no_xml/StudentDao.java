package com.springjdbc.no_xml;

import java.util.List;


public interface StudentDao {
	public  int insert(Student  student);
	public  int change(Student  student);
	public  int delete(Student  student);
	public  Student get(int studentId);
	public  List<Student> getAllStudents( );
	
}
