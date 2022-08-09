package fetch;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class Mapping2 {
	public static void main(String[] args) {
		SessionFactory sf = new Configuration().configure(new File("hibernate.cfgfectch.xml")).buildSessionFactory();
		Session ss = sf.openSession();
		Session ss2 =sf.openSession();//create new session get the session
//		Session ss3  =sf.getCurrentSession();//No CurrentSessionContext configured!
		
		System.out.println(ss==ss2);
//		One session 
		Transaction ts1 = ss.beginTransaction();//
//		Transaction ts2 = ss.getTransaction();// it singleton class
//		System.out.println(ts1 == ts2);

		Question qu1 = new Question();
		qu1.setQuestionId(1);
		qu1.setQuestionName("what is java");

		Question qu2 = new Question();
		qu2.setQuestionId(2);
		qu2.setQuestionName("what is python");

		Answer ans1 = new Answer();
		ans1.setAnswerId(1);
		ans1.setAnswerName("It is a programmig language");
		ans1.setAnswerAnswerField(qu1);

		Answer ans2 = new Answer();
		ans2.setAnswerId(2);
		ans2.setAnswerName("Java is compile time");
		ans2.setAnswerAnswerField(qu1);
		Answer ans3 = new Answer();
		ans3.setAnswerId(3);
		ans3.setAnswerName("Java is less famouse");
		ans3.setAnswerAnswerField(qu1);
		Answer ans4 = new Answer();
		ans4.setAnswerId(4);
		ans4.setAnswerName("python is runtime");
		ans4.setAnswerAnswerField2(qu2);
		Answer ans5 = new Answer();
		ans5.setAnswerId(5);
		ans5.setAnswerName("python is more famous");
		ans5.setAnswerAnswerField2(qu2);

		List<Answer> listAns1 = new ArrayList<Answer>();
		listAns1.add(ans1);
		listAns1.add(ans2);
		listAns1.add(ans3);
		qu1.setQuestionAnswerField(listAns1);
		List<Answer> listAns2 = new ArrayList<Answer>();
		listAns2.add(ans4);
		listAns2.add(ans5);
		qu2.setQuestionAnswerField(listAns2);
		ss.save(ans1);
//		ans1.setAnswerName("java use for coding");// connect to both database and  object instance in heap 
		ss.save(ans2);
		ss.save(ans3);
		ss.save(qu1);
//		--saving quesiton 2
		ss2.save(ans4);
		ss2.save(ans5);
		ss2.save(qu2);
		ts1.commit();
		ss2.beginTransaction().commit();
	}
}
