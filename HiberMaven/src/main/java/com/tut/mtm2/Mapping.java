package com.tut.mtm2;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.tut.HiberMaven.ConnectionProvider;

public class Mapping {
	public static void main(String[] args) {
		System.out.println("shivam");
		Session ss = ConnectionProvider.getIntance();
		Transaction ts = ss.beginTransaction();
		Emp e1 = new Emp();
		e1.setEid(1);
		e1.setName("rama");
		Emp e2 = new Emp();
		e2.setEid(2);
		e2.setName("shiva");
		Emp e3 = new Emp();
		e3.setEid(3);
		e3.setName("deepak");
		Emp e4 = new Emp();
		e4.setEid(4);
		e4.setName("suraj");

		Projects p1 = new Projects();
		p1.setEid(101);
		p1.setName("College website");

		Projects p2 = new Projects();
		p2.setEid(102);
		p2.setName("Chat bot");

		Projects p3 = new Projects();
		p3.setEid(103);
		p3.setName("web application");
		
		Projects p4 = new Projects();
		p4.setEid(104);
		p4.setName("Web serivces");
		
		List<Emp> le = new ArrayList<Emp>();
		le.add(e1);
		le.add(e2);
		le.add(e1);
		
		List<Projects> pl = new ArrayList<Projects>();
		pl.add(p1);		
		pl.add(p2);		
		pl.add(p3);	

//		List<Emp> le2 = new ArrayList<Emp>();
//		le2.add(e4);
//		p4.setProjects(le2);
//		
//		List<Projects> pl2 = new ArrayList<Projects>();
//		pl2.add(p1);		
//		pl2.add(p2);	
//		pl2.add(p4);	
//		e3.setProjects(pl2);
		
		e1.setProjects(pl);
		e2.setProjects(pl);
		p1.setProjects(le);
		p2.setProjects(le);
		p3.setProjects(le);
		
		ss.save(p1);
		ss.save(p2);
		ss.save(p3);
				
		ss.save(e1);
		ss.save(e2);
		
		
		ts.commit();
		System.out.println("shivam");

	}
}
