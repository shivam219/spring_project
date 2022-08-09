package com.tut.MapOneToOne;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Prod {
	@Id
	private int productid;
	@Column(name = "product_name")
	private String productName;

	@Column(name = "Type")
	private String Type = "Fruit";
	@OneToOne
//	@JoinColumn(name="reference_price")
	private Price price = new Price();
//	at runtime try to search price 

	@OneToOne
	private Conn conn;//conn + primary key column of consumer table
	/*
	 * if conn is reference variable is compulsary to use give one to
	 * 
	 * don't give column give variable name Conn class consumerID field will get
	 * column in Con table
	 */
	
//	@OneToMany(mappedBy = "Product")
	@OneToMany // Generate news table 
	private List<Supplier> supplier;

	
	public Conn getConn() {
		return conn;
	}

	public void setConn(Conn conn) {
		this.conn = conn;
	}

	public Prod() {
		super();
	}

	public int getProductid() {
		return productid;
	}

	public void setProductid(int productid) {
		this.productid = productid;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	@Override
	public String toString() {
		return "Product [Pid=" + productid + ", productName=" + productName + "]";
	}

	public List<Supplier> getSupplier() {
		return supplier;
	}

	public void setSupplier(List<Supplier> supplier) {
		this.supplier = supplier;
	}
	
	
}
