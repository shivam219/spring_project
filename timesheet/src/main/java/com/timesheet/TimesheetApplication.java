package com.timesheet;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;

@SpringBootApplication
public class TimesheetApplication {
	public static void main(String[] args) {
		ApplicationContext ac = SpringApplication.run(TimesheetApplication.class, args);
	}
}
