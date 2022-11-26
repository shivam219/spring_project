package com.timesheet.controller;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "timesheet_customer_domain")
public class CustomerDomain {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "customer_id")
	private int id;

	private String customerDomain;

	public CustomerDomain() {
		super();
	}

	public CustomerDomain(int id, String customerDomain) {
		super();
		this.id = id;
		this.customerDomain = customerDomain;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCustomerDomain() {
		return customerDomain;
	}

	public void setCustomerDomain(String customerDomain) {
		this.customerDomain = customerDomain;
	}

	@Override
	public String toString() {
		return "CustomerDomain [id=" + id + ", customerDomain=" + customerDomain + "]";
	}

}
