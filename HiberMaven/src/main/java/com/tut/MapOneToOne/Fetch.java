package com.tut.MapOneToOne;

import org.hibernate.Session;

import com.tut.HiberMaven.ConnectionProvider;

public class Fetch {
	public static void main(String[] args) {
		Session ss = ConnectionProvider.getIntance();
		Prod p1 = (Prod) ss.get(Prod.class, 101);
		System.out.println(p1);
		for (Supplier a : p1.getSupplier()) {
			System.out.println(a.getSupplierName());
		}
	}
}
