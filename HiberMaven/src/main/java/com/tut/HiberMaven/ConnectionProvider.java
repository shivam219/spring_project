package com.tut.HiberMaven;

import java.io.File;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class ConnectionProvider {
	private static Session ss = null;
//	System.out.println(student.class);
//	class com.tut.HiberMaven.student give qualified name of class

	public static Session getIntance() {
		if (ss == null) {
			Configuration cfg = new Configuration();
			cfg.configure(new File("hibernate.cfg.xml"));
			SessionFactory sf = cfg.buildSessionFactory();
			ss = sf.openSession();
		//	sf.close();//if close java.lang.IllegalStateException: Session/EntityManager is closed
			
		}
		return ss;
	}
}
