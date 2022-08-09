package com.springcore.lifecycle;

public class Samosa  {
	private int price;

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
		System.out.println("setting values");
	}

	public Samosa(int price) {
		super();
		this.price = price;
	}

	public Samosa() {
		super();
	}

	@Override
	public String toString() {
		return "Samosa [price=" + price + "]";
	}
	
	public void hii() {
		System.out.println("Inside init methods");
	}
	public void bii() {
	System.out.println("Inside destroy method");
	}

}
