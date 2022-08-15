package com.boot;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;

import com.boot.model.Employee;
import com.boot.respository.EmployeeRepository;

@SpringBootApplication
public class Application {
	public static void main(String[] args) {
		ApplicationContext ap = SpringApplication.run(Application.class, args);
		
//		UserRepository r = ap.getBean(UserRepository.class);
//		User u1 = new User();
//		u1.setName("shivam");
//		
//		User u2 = new User();
//		u2.setName("shivam");
// 		
//		List<User> of = List.of(u1,u2);
//		Iterable<User> saveAll = repository.saveAll(of);
//		
//		saveAll.forEach(e->System.out.println(e));
		
//		Throw NoSuchElementException
//		Optional<User> user = repository.findById(99);
//		System.out.println(user.get());
	
//		repository.deleteAll();
//		repository.deleteAll(List.of());accept collection of numbers
//		repository.deleteAllById(List.of()); only accept collection of numbers
//		repository.deleteById(10);
		
		
//		delete record in mysql
//		r.delete(new User(12,"d"));
		
//		deleting all object in database
//		Iterable<User> findAll = r.findAll();
//		r.deleteAll(findAll);
		
		
//		r.existsById(10);
		Employee e = new Employee();
		e.setEmpId(10);
		e.setEmpPassword("root");
		
		EmployeeRepository er = ap.getBean(EmployeeRepository.class);
		Boolean findByEmpIdAndEmpPassword = er.existsByEmpIdAndEmpPassword(e.getEmpId(), e.getEmpPassword());
		System.out.println(findByEmpIdAndEmpPassword );
	 
		
	}
}
