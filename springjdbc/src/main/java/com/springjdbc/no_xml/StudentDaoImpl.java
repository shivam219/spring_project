package com.springjdbc.no_xml;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;


@Component("studentDao")
public class StudentDaoImpl implements StudentDao {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	/* automatic find jdbcTemplate in configuration attach  and inject to it*/

	public int insert(Student student) {
		int update = this.jdbcTemplate.update("insert into student(id,name,city) values(?,?,?)", student.getId(),
				student.getName(), student.getCity());
		return update;
	}

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

	public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
		this.jdbcTemplate = jdbcTemplate;
	}

	public int change(Student student) {
		int update = this.jdbcTemplate.update("update student set name = ? , city = ?  where id = ? ",
				student.getName(), student.getCity(), student.getId());
		return update;
	}

	public int delete(Student student) {
		int delete = this.jdbcTemplate.update("delete from student  where id = ? ", student.getId());
		return delete;
	}

	public Student get(int studentId) {
		String query = "select * from student where id  = ?";
		RowMapper<Student> mapper = new RowMapperImp();
		Student student = null;
		try {
			student = jdbcTemplate.queryForObject(query, mapper, studentId);
		} catch (org.springframework.dao.EmptyResultDataAccessException e) {
			e.printStackTrace();
		}
		return student;
	}

	public List<Student> getAllStudents() {
		String query = "select * from student where id  = ?";
		List<Student> list = jdbcTemplate.query(query, new RowMapperImp());
		return list;
	}

}
