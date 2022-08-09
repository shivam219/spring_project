package com.tut.HiberMaven;

import javax.persistence.Embeddable;

import org.hibernate.Session;
import org.hibernate.Transaction;

public class Embeddable_annotation {
	public static void main(String[] args) {
		Session ss = ConnectionProvider.getIntance();
		student st = new student();
		st.setRoll(11);
		st.setName("shivam");
		st.setCity("nandivali");
		st.setCerti(new Certificate("java", " 3 month"));
//		before saving object called begin transaction
		/*
		 * order arranging column is ascending order of column name If use @Embeddable
		 * then after primary key column Embeddable class field will get column in
		 * ascending order
		 */
		Transaction trs = ss.beginTransaction();
		ss.save(st);
		trs.commit();
	}
}
