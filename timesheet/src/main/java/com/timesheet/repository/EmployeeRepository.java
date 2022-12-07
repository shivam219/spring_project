package com.timesheet.repository;

import java.util.List;

import javax.persistence.Tuple;
import javax.transaction.Transactional;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.timesheet.model.Employee;

@EnableJpaRepositories
@Repository
public interface EmployeeRepository extends JpaRepository<Employee, Long> {
	public Employee findByEmpId(Long empId);

	public Boolean existsByEmpId(Long empId);
//	public Boolean existsByEmpEmailIgnoreCase(String empEmail);

	@Query(value = "select emp_id from timesheet_user_master where emp_id in (select emp_id from timesheet_employee_master where lower(emp_email) =  lower(:email))", nativeQuery = true)
	public Long findByEmpEmailIgnoreCase(@Param("email") String empEmail);

	@Modifying
	@Query(value = "insert into timesheet_employee_master (emp_id , emp_name, emp_email, emp_password,emp_password_encrypt, emp_city ,emp_address,emp_phone,emp_pincode) "
			+ "values (:id, :name ,  :email , :pass ,  sha1(:pass) , :city , :address , :phone , :pincode );", nativeQuery = true)
	@Transactional
	public int saveEmployee(@Param("id") long id, @Param("name") String name, @Param("email") String email,
			@Param("pass") String pass, @Param("city") String city, @Param("address") String address,
			@Param("phone") String phone, @Param("pincode") String pincode);

	@Query(value = "SELECT * FROM timesheet_employee_master WHERE emp_password_encrypt = sha1(:pass)  AND emp_id =:id ", nativeQuery = true)
	public Employee isValidEmployee(@Param("id") long empId, @Param("pass") String empPassword);

	@Modifying
	@Transactional
	@Query(value = "  update  timesheet_employee_master set emp_password_encrypt = sha1(:empPass)  , emp_password = :empPass where emp_id= :empId", nativeQuery = true)
	int updateEmployeePassword(@Param(value = "empId") long empId, @Param(value = "empPass") String empPass);

	@Query(value = "SELECT emp_email FROM timesheet_employee_master where emp_id =:empId", nativeQuery = true)
	public String findEmpEmailByEmpId(@Param("empId") Long empId);

//	@Query(value="SELECT * FROM ess.timesheet_employee_master order by first_name" ,nativeQuery =  true)
	public Page<Employee> findAll(Pageable pageable);
//	Pageable pageable = new PageRequest(page, size, Sort.Direction.ASC, "name");

	@Query(value = "SELECT concat(date_format(birth_date,'%D %b' ),', ',concat(first_name,' ',middle_name,' ',last_name)) as Birthdays FROM timesheet_employee_master where month(birth_date)=month(now()) order by Birthdays ASC ;", nativeQuery = true)
	public List<Object> getEmpBirthday(@Param("year") String year, @Param("month") String month);

	@Query(value = "\n"
			+ "select * from  timesheet_employee_master  where emp_id in  (select emp_id from  timesheet_user_master where emp_id not in (SELECT emp_id FROM timesheet_user_group_mapping))  ", nativeQuery = true)
	public List<Employee> findEmployeeNotHavingGroup();

	@Query(value = "SELECT * FROM ess.timesheet_employee_master where emp_id not in ( SELECT emp_id FROM ess.timesheet_user_master)", nativeQuery = true)
	public List<Employee> findAllEmployeeNotMapUser();

	@Query(value = "SELECT * FROM ess.timesheet_employee_master where emp_id in ( SELECT emp_id FROM ess.timesheet_user_master)", nativeQuery = true)
	public List<Employee> findAllEmployeeMapUser();

	List<Employee> findAll(Sort sort);

	@Query(value = "SELECT e.emp_id , CONCAT(first_name,' ',middle_name,' ',last_name) employeeName FROM timesheet_employee_master e , timesheet_user_master  u where e.emp_id = u.emp_id", nativeQuery = true)
	List<Tuple> findEmployeeName();

	@Query(value = "SELECT  CONCAT(first_name,' ',middle_name,' ',last_name) employeeName FROM timesheet_employee_master   where emp_id = :empId", nativeQuery = true)
	public String findEmployeeName(long empId);

	@Query(value = "SELECT year_code FROM timesheet_employee_master , timesheet_financial_year where  year_code >= year(date_of_join) and  emp_id = :empId ", nativeQuery = true)
	List<String> findEmployeeWorkingYear(Long empId);

	@Query(value = "SELECT  m.month_sheet_id,  monthname(month) FROM ess.timesheet_month_sheet m where emp_id = :empId "
			+ "and  m.approved = 'Y' and year(month) = :yearCode", nativeQuery = true)
	List<String[]> findEmployeeWorkingMonth(Long empId, Integer yearCode);

}
