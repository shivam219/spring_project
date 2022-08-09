package com.tut.HiberMaven;

import java.io.FileInputStream;
import java.util.Date;

import org.hibernate.Session;
import org.hibernate.Transaction;

public class App {
	public static void main(String[] args) throws Exception {
		System.out.println("Running hibernate project");
		Session session = ConnectionProvider.getIntance();
		Transaction ts = session.beginTransaction();
		student ob = new student(8, "rohit", "mumbai");
		session.save(ob);
		FileInputStream fos = new FileInputStream("src/main/java/facebook.png");
		byte[] img = new byte[fos.available()];
//		new Date()// give current date
		Address ads = new Address(4, "nandivali", "Dombivali", true, 0, new Date(), img);
		session.save(ads);

		ts.commit();// use for commit
	}

}
