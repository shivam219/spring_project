package com.timesheet;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;

@SpringBootApplication
//@ComponentScan( ) 
//Automatic searching bean from base package and sub-package
public class TimesheetApplication {
	public static void main(String[] args) {
		ApplicationContext ac = SpringApplication.run(TimesheetApplication.class, args);
		
		
		
//		EmployeeRepository12 empRepo = ac.getBean(EmployeeRepository12.class);
		/*  //working here explicitly
		 * Employee emp = new Employee(); emp.setEmpId(1); emp.setEmpName("shivam");
		 * emp.setEmpEmail("shivam219"); emp.setEmpPassword("root");
		 * 
		 * emp.setEmpCity("dombivali"); emp.setEmpAddress("nandivali");
		 * emp.setEmpPhone("87797"); emp.setEmpPincode("421201"); empRepo.save(emp);
		 * 
		 */	}

}
