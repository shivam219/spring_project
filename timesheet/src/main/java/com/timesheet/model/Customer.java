package com.timesheet.model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.LastModifiedBy;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.timesheet.controller.CustomerDomain;

@Entity
@Table(name = "timesheet_customer_master")
public class Customer {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "customer_id")
	private int customerId;

	@Column(name = "customer_name")
	private String customerName;

	@Column(name = "on_board_date")
	private String onBoardDate;

	@Column(name = "off_board_date")
	private String offBoardDate;

	@Column(name = "customer_representative")
	private String customerRepresentative;

//	@JsonBackReference
	@ManyToOne
	@JoinColumn(name = "customer_domain")
	CustomerDomain customerDomain;

	@JsonBackReference
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "emp_id")
	User user;
//	getting error on orphanRemoval = true while updating data
	@JsonManagedReference(value = "customer-project")
	@OneToMany(mappedBy = "customer", fetch = FetchType.LAZY, cascade = CascadeType.ALL, targetEntity = Project.class)
	List<Project> project;

	@CreationTimestamp
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "create_time", updatable = false)
	private Date createTime;

	@CreatedBy
	@Column(name = "created_by")
	String createdBy;

	@UpdateTimestamp
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "modify_time")
	private Date modifyTime;

	@LastModifiedBy
	@Column(name = "modified_by")
	String modifiedBy;

	public Customer() {
		super();
	}

	public Customer(int customerId, String customerName, String onBoardDate, String offBoardDate,
			String customerRepresentative, CustomerDomain customerDomain, User user, List<Project> project) {
		super();
		this.customerId = customerId;
		this.customerName = customerName;
		this.onBoardDate = onBoardDate;
		this.offBoardDate = offBoardDate;
		this.customerRepresentative = customerRepresentative;
		this.customerDomain = customerDomain;
		this.user = user;
		this.project = project;
	}

	public int getCustomerId() {
		return customerId;
	}

	public void setCustomerId(int customerId) {
		this.customerId = customerId;
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
	public String getCreateTimeSort2() {
		return createTime.toLocaleString().substring(0,11);
	}

//	public String getOnBoardDateFormated() {
//		Date d = null;
//		try {
//			d = new SimpleDateFormat("yyyy-MM-dd").parse(onBoardDate);
//		} catch (ParseException e) {
//			e.printStackTrace();
//		}
//		String mydate = d.getDate() + " " + (d.getMonth() + 1) + " " + d.getYear();
//		return mydate;
//	}

	public void setOnBoardDate(String onBoardDate) {
		this.onBoardDate = onBoardDate;
	}

	public String getOffBoardDate() {
		return offBoardDate;
	}

	public void setOffBoardDate(String offBoardDate) {
		this.offBoardDate = offBoardDate;
	}

	public String getCustomerRepresentative() {
		return customerRepresentative;
	}

	public void setCustomerRepresentative(String customerRepresentative) {
		this.customerRepresentative = customerRepresentative;
	}

	public CustomerDomain getCustomerDomain() {
		return customerDomain;
	}

	public void setCustomerDomain(CustomerDomain customerDomain) {
		this.customerDomain = customerDomain;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public List<Project> getProject() {
		return project;
	}

	public void setProject(List<Project> project) {
		this.project = project;
	}

	@Override
	public String toString() {
		return "Customer [customerId=" + customerId + ", customerName=" + customerName + ", onBoardDate=" + onBoardDate
				+ ", offBoardDate=" + offBoardDate + ", customerRepresentative=" + customerRepresentative
				+ ", customerDomain=" + customerDomain + ", user=" + "" + ", project=" + "" + "]";
	}

}
