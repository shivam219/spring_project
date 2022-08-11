package t.auto;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.stereotype.Component;

public class auto {
	public static void main(String[] args) {
//		ApplicationContext applicationContext = new ClassPathXmlApplicationContext("t/auto/config.xml");
		ApplicationContext applicationContext = new AnnotationConfigApplicationContext(Config.class);
		System.out.println(applicationContext.getBean("d1"));
		System.out.println(applicationContext.getBean("co"));
	}
}

@Component("s1")
class Student {
	@Value("10")
	String id;
	@Value("shivam")
	String name;

	public Student() {
		super();
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Override
	public String toString() {
		return "Student [id=" + id + ", name=" + name + "]";
	}
}

@Component("d1")
class details {

	@Value("ess")
	String org;

	@Autowired
//	@Qualifier("s1")
	Student s12;

	public details() {
		super();
	}

	public details(String org, Student s1) {
		super();
		this.org = org;
		this.s12 = s1;
		System.out.println("constructor use");
	}

	public String getOrg() {
		return org;
	}

	public void setOrg(String org) {
		this.org = org;

	}

	public Student getS1() {
		return s12;
	}

	public void setS1(Student s1) {
		this.s12 = s1;
		System.out.println("setter us");
	}

	@Override
	public String toString() {
		return "details [org=" + org + ", s1=" + s12 + "]";
	}

}

@Component("co")
@Configuration
@ComponentScan("t.auto")
class Config{
	
	@Autowired
	details d ;

	@Bean(name="e1")
	public details getd() {
		return new details();
	}

	public details getD() {
		return d;
	}

	public void setD(details d) {
		this.d = d;
	}

	@Override
	public String toString() {
		return "Config [d=" + d + "]";
	}
}
