package com.timesheet.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "timesheet_gen_locations")
public class GenLocation {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "LOC_CODE")
	long locCode;

	@Column(name = "LOC_DESC")
	String locDesc;
	@Column(name = "LOC_ABBR")
	String locAbbr;
	@Column(name = "LOC_TYPE")
	String locType;
	@Column(name = "REF_LOC_CODE")
	String refLocCode;
	@Column(name = "USER_ID")
	String userId;
	@Column(name = "DATE_STAMP")
	String dateStamp;

	public GenLocation() {
		super();
	}

	public GenLocation(long locCode, String locDesc, String locAbbr, String locType, String refLocCode, String userId,
			String dateStamp) {
		super();
		this.locCode = locCode;
		this.locDesc = locDesc;
		this.locAbbr = locAbbr;
		this.locType = locType;
		this.refLocCode = refLocCode;
		this.userId = userId;
		this.dateStamp = dateStamp;
	}

	public long getLocCode() {
		return locCode;
	}

	public void setLocCode(long locCode) {
		this.locCode = locCode;
	}

	public String getLocDesc() {
		return locDesc;
	}

	public void setLocDesc(String locDesc) {
		this.locDesc = locDesc;
	}

	public String getLocAbbr() {
		return locAbbr;
	}

	public void setLocAbbr(String locAbbr) {
		this.locAbbr = locAbbr;
	}

	public String getLocType() {
		return locType;
	}

	public void setLocType(String locType) {
		this.locType = locType;
	}

	public String getRefLocCode() {
		return refLocCode;
	}

	public void setRefLocCode(String refLocCode) {
		this.refLocCode = refLocCode;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getDateStamp() {
		return dateStamp;
	}

	public void setDateStamp(String dateStamp) {
		this.dateStamp = dateStamp;
	}

	@Override
	public String toString() {
		return "Genlocation [locCode=" + locCode + ", locDesc=" + locDesc + ", locAbbr=" + locAbbr + ", locType="
				+ locType + ", refLocCode=" + refLocCode + ", userId=" + userId + ", dateStamp=" + dateStamp + "]";
	}

}
