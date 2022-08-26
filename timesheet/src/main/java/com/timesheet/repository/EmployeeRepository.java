package com.timesheet.repository;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.timesheet.model.Employee;

public interface EmployeeRepository  extends CrudRepository<Employee, Integer> {
	public Employee findByEmpIdAndEmpPassword(int empId ,String empPassword);
	public Boolean existsByEmpIdAndEmpPassword(int empId ,String empPassword);
	
	@Modifying
	@Query(value = "insert into ess_employee (emp_id , emp_name, emp_email, emp_password,emp_password_encrypt, emp_city ,emp_address,emp_phone,emp_pincode) "
			+ "values (:id, :name ,  :email , :pass ,  sha1(:pass) , :city , :address , :phone , :pincode );", nativeQuery = true)
	@Transactional
	public int saveEmployee(@Param("id") long id, @Param("name") String name , @Param("email") String email,	
							@Param("pass") String pass , @Param("city") String city,@Param("address") String address,
							@Param("phone") String phone, @Param("pincode") String pincode
			);
	
 
	@Query(value = "SELECT * FROM ess_employee WHERE emp_password_encrypt = sha1(:pass)  AND emp_id =:id ", nativeQuery = true )
	public Employee isValidEmployee(@Param("id") long empId, @Param("pass") String empPassword );
	
}
