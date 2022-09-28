package com.timesheet.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table
public class Customer {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "customer_id")
	private int customerId;
	@Column(name = "customer_type")
	private String customerType;

	@Column(name = "customer_name")
	private String customerName;

	@Column(name = "on_board_date")
	private String onBoardDate;
	@Column(name = "off_board_date")
	private String offBoardDate;

	public Customer() {
		super();
	}

	public Customer(int customerId, String customerType, String customerName, String onBoardDate, String offBoardDate) {
		super();
		this.customerId = customerId;
		this.customerType = customerType;
		this.customerName = customerName;
		this.onBoardDate = onBoardDate;
		this.offBoardDate = offBoardDate;
	}

	public int getCustomerId() {
		return customerId;
	}

	public void setCustomerId(int customerId) {
		this.customerId = customerId;
	}

	public String getCustomerType() {
		return customerType;
	}

	public void setCustomerType(String customerType) {
		this.customerType = customerType;
	}

	public String getCustomerName() {
		return customerName;
	}

	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}

	public String getOnBoardDate() {
		return onBoardDate;
	}

	public void setOnBoardDate(String onBoardDate) {
		this.onBoardDate = onBoardDate;
	}

	public String getOffBoardDate() {
		return offBoardDate;
	}

	public void setOffBoardDate(String offBoardDate) {
		this.offBoardDate = offBoardDate;
	}

	@Override
	public String toString() {
		return "Customer [customerId=" + customerId + ", customerType=" + customerType + ", customerName="
				+ customerName + ", onBoardDate=" + onBoardDate + ", offBoardDate=" + offBoardDate + "]";
	}

}
