package com.springcore.lifecycle;

import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;

public class coca implements InitializingBean, DisposableBean {
	private int price;

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	@Override
	public String toString() {
		return "coca [price=" + price + "]";
	}

	public coca(int price) {
		super();
		this.price = price;
	}

	public coca() {
		super();
	}

	public void afterPropertiesSet() throws Exception {
		System.out.println("taking coca : int");
	}

	public void destroy() throws Exception {
		System.out.println("put to gurbage coca : destroy");
	}

}
