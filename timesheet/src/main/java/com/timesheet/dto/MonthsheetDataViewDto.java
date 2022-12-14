package com.timesheet.dto;

import java.math.BigDecimal;
import java.util.List;

public class MonthsheetDataViewDto {

	String date;
	String totalHour;
	List<MonthSheetDataDto> dataDtos;

	public MonthsheetDataViewDto() {
		super();
	}

	public MonthsheetDataViewDto(String date, String totalHour, List<MonthSheetDataDto> dataDtos) {
		super();
		this.date = date;
		this.totalHour = totalHour;
		this.dataDtos = dataDtos;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getTotalHour() {
		return totalHour;
	}

	public void setTotalHour(String totalHour) {
		this.totalHour = totalHour;
	}

	public void setTotalHour(BigDecimal totalHour) {
		this.totalHour = totalHour.toString();
	}

	public List<MonthSheetDataDto> getDataDtos() {
		return dataDtos;
	}

	public void setDataDtos(List<MonthSheetDataDto> dataDtos) {
		this.dataDtos = dataDtos;
	}

	@Override
	public String toString() {
		return "MonthsheetDataViewDto [date=" + date + ", totalHour=" + totalHour + ", dataDtos=" + dataDtos + "]";
	}

}