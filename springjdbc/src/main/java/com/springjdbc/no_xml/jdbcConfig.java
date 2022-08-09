package com.springjdbc.no_xml;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

@Configuration
public class jdbcConfig {

	@Bean(name = { "ds" })
	public DriverManagerDataSource getDataSource() {
		DriverManagerDataSource ds = new DriverManagerDataSource();
		ds.setDriverClassName("com.mysql.cj.jdbc.Driver");
		ds.setUrl("jdbc:mysql://localhost:3306/springjdbc");
		ds.setUsername("root");
		ds.setPassword("Shivam@219@");
		return ds;
	}

	@Bean(name = { "jdbcTemplate" })
	public JdbcTemplate getJdbcTemplate() {
		JdbcTemplate jt = new JdbcTemplate();
		jt.setDataSource(getDataSource());
		return jt;
	}

	/*
	 * @Bean(name= {"studentDao"}) public StudentDao getStudentDao() {
	 * StudentDaoImpl dao = new StudentDaoImpl();
	 * dao.setJdbcTemplate(getJdbcTemplate()); return dao; }
	 */
}
