package com.timesheet.repository;

import javax.transaction.Transactional;

//import org.springframework.boot.autoconfigure.data.web.SpringDataWebProperties.Pageable;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.timesheet.model.Employee;

public interface EmployeeRepository extends CrudRepository<Employee, Long> {
	public Employee findByEmpIdAndEmpPassword(Long empId, String empPassword);

	public Boolean existsByEmpIdAndEmpPassword(Long empId, String empPassword);

	@Modifying
	@Query(value = "insert into ess_employee (emp_id , emp_name, emp_email, emp_password,emp_password_encrypt, emp_city ,emp_address,emp_phone,emp_pincode) "
			+ "values (:id, :name ,  :email , :pass ,  sha1(:pass) , :city , :address , :phone , :pincode );", nativeQuery = true)
	@Transactional
	public int saveEmployee(@Param("id") long id, @Param("name") String name, @Param("email") String email,
			@Param("pass") String pass, @Param("city") String city, @Param("address") String address,
			@Param("phone") String phone, @Param("pincode") String pincode);

	@Query(value = "SELECT * FROM ess_employee WHERE emp_password_encrypt = sha1(:pass)  AND emp_id =:id ", nativeQuery = true)
	public Employee isValidEmployee(@Param("id") long empId, @Param("pass") String empPassword);

	@Modifying
	@Transactional
	@Query(value = "  update  ess_employee set emp_password_encrypt = sha1(:empPass)  , emp_password = :empPass where emp_id= :empId", nativeQuery = true)
	int updateEmployeePassword(@Param(value = "empId") long empId, @Param(value = "empPass") String empPass);

	@Query(value = "SELECT emp_email FROM ess_employee where emp_id =:empId", nativeQuery = true)
	public String getEmailById(@Param("empId") Long empId);


	@Query(value="SELECT * FROM ess.ess_employee order by first_name" ,nativeQuery =  true)
	public Page<Employee> findEmployee(Pageable pageable);

	
}
