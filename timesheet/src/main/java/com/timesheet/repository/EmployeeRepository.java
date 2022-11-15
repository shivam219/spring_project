package com.timesheet.repository;

import java.util.List;

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

	public Boolean existsByEmpId(Long empId);

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
	
	@Query(value="SELECT concat(date_format(birth_date,'%D %b' ),', ',concat(first_name,' ',middle_name,' ',last_name)) as Birthdays FROM ess_employee where month(birth_date)=month(now()) order by Birthdays ASC ;" ,nativeQuery =  true)
	public List<Object> getEmpBirthday(@Param("year") String year, @Param("month") String month);
	


	@Query(value="\n"
			+ "select * from  ess_employee  where emp_id in  (select emp_id from  ess_user_master where emp_id not in (SELECT emp_id FROM ess.ess_user_group_mapping))" ,nativeQuery =  true)
	public List<Employee> findEmployeeNotHavingGroup();

	@Query(value="SELECT * FROM ess.ess_employee where emp_id not in ( SELECT emp_id FROM ess.ess_user_master)" ,nativeQuery = true)
	public List<Employee> findAllEmployeeNotMapUser();
	
}
