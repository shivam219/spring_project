package com.tut.MapOneToOne;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Price {
	@Id
	@Column(name="Myprice")
	private int price = 10;

	public Price() {
	}
	public Price(int p) {
		this.price =p;
	}	

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}
	
}
