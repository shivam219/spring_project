package com.timesheet.dao.imp;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.timesheet.dao.EmployeeDao;
import com.timesheet.model.Employee;

/**
 * Hello world!
 *
 */
public class App {
	public static void main(String[] args) {
		ApplicationContext context = new ClassPathXmlApplicationContext("com/timesheet/dao/imp/config.xmL");
		EmployeeDao empDao = context.getBean("employeeDao", EmployeeDao.class);
		Employee emp = new Employee();
		emp.setEmpId(1);
		emp.setEmpName("shivam");
		emp.setEmpEmail("shivam219");
		emp.setEmpPassword("root");
		
		emp.setEmpCity("dombivali");
		emp.setEmpAddress("nandivali");
		emp.setEmpPhone("87797");
		emp.setEmpPincode("421201");
		int insert = empDao.save(emp);
		System.out.println(insert);
	}
}
