package com.timesheet.repository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.timesheet.model.Employee;

@Repository
public interface EmployeeRepository extends CrudRepository<Employee, Integer> {


//	public Employee findByEmpIdAndEmpPassword(long empId, String empPassword);
//	@Query("SELECT a FROM Author a WHERE firstName = ?1 AND lastName = ?2")
//	public Boolean existsByEmpIdAndEmpPassword(long empId, String empPassword);
	
	@Modifying
	@Query(value = "insert into ess_employee (emp_id , emp_name, emp_email, emp_password,pass_encrypt, emp_city ,emp_address,emp_phone,emp_pincode) "
			+ "values (14,'shivam', 'shivam@219', 'root',  AES_ENCRYPT('root','pass') , 'mumbai' , 'mumbai' ,'87797' ,'421201' );", nativeQuery = true)
	@Transactional
	public int sett();
	
	@Query(value = "select * from ess_employee where cast(aes_decrypt(pass_encrypt, 'pass') AS char) =:pwd  and emp_id =:id ", nativeQuery = true )
	public List<Employee> check(@Param("id") long empId, @Param("pwd") String empPassword );
	
}
