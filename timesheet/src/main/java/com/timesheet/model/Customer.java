package com.timesheet.model;

import javax.annotation.Generated;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table

public class Customer {
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private int customerid;
	private String customertype;
	private String customername;
	private String projectid;
	private String projectname;
	private String onboarddate;
	private String offboarddate;
	
	
	
	public int getCustomerid() {
		return customerid;
	}
	public void setCustomerid(int customerid) {
		this.customerid = customerid;
	}
	public String getCustomertype() {
		return customertype;
	}
	public void setCustomertype(String customertype) {
		this.customertype = customertype;
	}
	public String getCustomername() {
		return customername;
	}
	public void setCustomername(String customername) {
		this.customername = customername;
	}
	public String getProjectid() {
		return projectid;
	}
	public void setProjectid(String projectid) {
		this.projectid = projectid;
	}
	public String getProjectname() {
		return projectname;
	}
	public void setProjectname(String projectname) {
		this.projectname = projectname;
	}
	
	public String getOnboarddate() {
		return onboarddate;
	}
	public void setOnboarddate(String onboarddate) {
		this.onboarddate = onboarddate;
	}
	public String getOffboarddate() {
		return offboarddate;
	}
	public void setOffboarddate(String offboarddate) {
		this.offboarddate = offboarddate;
	}
	public Customer(int customerid, String customertype, String customername, String projectid, String projectname) {
		super();
		this.customerid = customerid;
		this.customertype = customertype;
		this.customername = customername;
		this.projectid = projectid;
		this.projectname = projectname;
		
	}
	public Customer(String onboarddate, String offboarddate) {
		super();
		this.onboarddate = onboarddate;
		this.offboarddate = offboarddate;
	}
	@Override
	public String toString() {
		return "Customer [customerid=" + customerid + ", customertype=" + customertype + ", customername="
				+ customername + ", projectid=" + projectid + ", projectname=" + projectname + "]";
	}
	public Customer() {
		super();
		// TODO Auto-generated constructor stub
	}
	

}
