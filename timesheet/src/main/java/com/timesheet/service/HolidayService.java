package com.timesheet.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.timesheet.repository.HolidayRepository;

@Service
public class HolidayService{
	
	@Autowired
	public HolidayRepository holidayRepository;
	
//	public List<String> getHoliday() {
//		return holidayRepository.getHolidays();
//	}

}
