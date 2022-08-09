package fetch;

import java.io.File;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class fetch {
	public static void main(String[] args) {
		SessionFactory sf = new Configuration().configure(new File("hibernate.cfgfectch.xml")).buildSessionFactory();
		Session ss = sf.openSession();
		Question qu1 = ss.get(Question.class, 1);
//		System.out.println(qu1);
		for (Answer lia : qu1.getQuestionAnswerField()) {
			System.out.println(lia.getAnswerName());
		}

	}
}
