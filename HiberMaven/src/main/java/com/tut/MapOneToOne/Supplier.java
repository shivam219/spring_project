package com.tut.MapOneToOne;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
@Entity
public class Supplier {
	@Id
	private int supplierID;
	@Column(name="supplier_name")
	private String supplierName;
	@Column(name="supplier_product")
	private String supplierProduct;
	@ManyToOne
	private Prod Product;
//	fetch product id of this object 
	
	public Supplier() {
		super();
	}
	public int getSupplierID() {
		return supplierID;
	}
	public void setSupplierID(int supplierID) {
		this.supplierID = supplierID;
	}
	public String getSupplierName() {
		return supplierName;
	}
	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}
	public String getSupplierProduct() {
		return supplierProduct;
	}
	public void setSupplierProduct(String supplierProduct) {
		this.supplierProduct = supplierProduct;
	}
	public Prod getProduct() {
		return Product;
	}
	public void setProduct(Prod product) {
		Product = product;
	}
	
}
