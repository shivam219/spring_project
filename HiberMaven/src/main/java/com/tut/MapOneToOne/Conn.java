package com.tut.MapOneToOne;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToOne;

@Entity
public class Conn {
	@Id
	@Column(name = "consumer_id")
	private int consumerID;
	@Column(name = "consumer_name")
	private String consumerName;
	//@JoinColumn(name = "product_id_ref")//use to give name of reference column
	@OneToOne
	private Prod product; //conn + primary key column of product table

	
	public Conn() {
		super();
	}
	
	public int getConsumerID() {
		return consumerID;
	}

	public void setConsumerID(int consumerID) {
		this.consumerID = consumerID;
	}

	public String getConsumerName() {
		return consumerName;
	}

	public void setConsumerName(String consumerName) {
		this.consumerName = consumerName;
	}

	public Prod getProduct() {
		return product;
	}

	public void setProduct(Prod product) {
		this.product = product;
	}

	@Override
	public String toString() {
		return "Cunsumer [consumerID=" + consumerID + ", consumerName=" + consumerName + ", product=" + product + "]";
	}

}
