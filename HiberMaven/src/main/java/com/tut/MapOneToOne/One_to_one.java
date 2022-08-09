package com.tut.MapOneToOne;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.tut.HiberMaven.ConnectionProvider;

public class One_to_one {
	public static void main(String[] args) {
		Session ss = ConnectionProvider.getIntance();
		Transaction ts = ss.beginTransaction();
		Conn cun = new Conn();
		cun.setConsumerID(1);
		cun.setConsumerName("rama");
		
		Prod p1 = new Prod();
		p1.setProductid(101);
		p1.setProductName("apple");
		
		Supplier s1 = new Supplier();
		s1.setSupplierID(1);
		s1.setSupplierName("arjun");
		s1.setSupplierProduct("apple");
		s1.setProduct(p1);
		Supplier s2 = new Supplier();
		s2.setSupplierID(2);
		s2.setSupplierName("karn");
		s2.setSupplierProduct("apple");
		s2.setProduct(p1);
		List<Supplier> ls = new ArrayList<Supplier>();
		ls.add(s1);
		ls.add(s2);
		p1.setSupplier(ls);
		
		cun.setProduct(p1);
		p1.setConn(cun);
		ss.save(cun);		
		ss.save(new Price());
		ss.save(s1);
		ss.save(s2);
		ss.save(p1);
		ts.commit();

		Conn getcun = (Conn) ss.get(Conn.class, 1);
		System.out.println(getcun.getConsumerID());
		System.out.println(getcun.getConsumerName());
		System.out.println(getcun.getProduct().getProductid());
		System.out.println(getcun.getProduct().getProductName());
		System.out.println("Getting product details");

		Prod getpro = (Prod) ss.get(Prod.class, 101);
		System.out.println(getpro.getProductid());
		System.out.println(getpro.getProductName());
//		System.out.println(getpro.getConn().getConsumerID());
//		System.out.println(getpro.getConn().getConsumerName());
	}
}
