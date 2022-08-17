package com.boot.respository;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import com.boot.model.Employee;

public interface EmployeeRepository  extends CrudRepository<Employee, Integer> {
	public Employee findByEmpIdAndEmpPassword(int empId ,String empPassword);
	public Boolean existsByEmpIdAndEmpPassword(int empId ,String empPassword);
	
	@Modifying
	@Query(value = "insert into ess_employee (emp_id , emp_name, emp_email, emp_password,emp_password_encrypt, emp_city ,emp_address,emp_phone,emp_pincode) "
			+ "values (14,'shivam', 'shivam@219', 'root',  AES_ENCRYPT('root','pass') , 'mumbai' , 'mumbai' ,'87797' ,'421201' );", nativeQuery = true)
	@Transactional
	public int sett();
	

	@Query(value = " SELECT * FROM ess_employee WHERE CAST(AES_DECRYPT(emp_password_encrypt, 'pass') AS CHAR) =:pass  AND emp_id =:id ", nativeQuery = true )
	public List<Employee> isValidEmployee(@Param("id") long empId, @Param("pass") String empPassword );

	@Query(value = " SELECT * FROM ess_employee WHERE CAST(AES_DECRYPT(emp_password_encrypt, 'pass') AS CHAR) =:pass  AND emp_id =:id ", nativeQuery = true )
	public Employee existsByEmployee(@Param("id") long empId, @Param("pass") String empPassword );

	@Query(value = " SELECT * FROM ess_employee WHERE CAST(AES_DECRYPT(emp_password_encrypt, 'pass') AS CHAR) =:pass  AND emp_id =:id ", nativeQuery = true )
	public Employee isValidEmployee1(@Param("id") long empId, @Param("pass") String empPassword );

	
	
}
