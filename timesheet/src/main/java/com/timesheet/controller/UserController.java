package com.timesheet.controller;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.timesheet.model.Employee;
import com.timesheet.model.User;
import com.timesheet.model.UserGroup;
import com.timesheet.model.UserGroupMapping;
import com.timesheet.repository.EmployeeRepository;
import com.timesheet.repository.UserGroupMappingRepository;
import com.timesheet.repository.UserGroupRepository;
import com.timesheet.repository.UserRepository;
import com.timesheet.service.EmployeeService;
import com.timesheet.service.UserMasterService;

@Controller
public class UserController {

	@Autowired
	EmployeeRepository er;
	@Autowired
	UserGroupRepository uGR;
	@Autowired
	UserGroupMappingRepository ugmr;
	@Autowired
	UserRepository ur;

	@Autowired
	UserMasterService us;

	@Autowired
	EmployeeService es;

	/*
	 * Access Change Password Page
	 */
	@GetMapping(value = "/change-password")
	public String getMethodName() {
		return "change-password";
	}

	/*
	 * Changing password post request
	 */
	@PostMapping(value = "/change-password")
	public ResponseEntity<Object> changePassword(HttpServletRequest request,
			@RequestParam(value = "oldPass") String oldPass, @RequestParam(value = "newPass") String newPass) {
		long empId = (long) request.getSession().getAttribute("empId");
		if (ur.existsByEmpIdAndPassword(empId, oldPass)) {
			ur.updateEmployeePassword(empId, newPass);
			return ResponseEntity.status(HttpStatus.ACCEPTED).body("password is updated successfully");
		}
		return ResponseEntity.status(HttpStatus.FORBIDDEN).body("Old Password is invalid");
	}

	@GetMapping(value = "user_gui")
	public String getMethoame() {
		return "user_gui";
	}

	/*
	 * Access user master page
	 */
	@GetMapping(value = "/user-master")
	public ModelAndView userMaster() {
		ModelAndView m = new ModelAndView("user-master");
		m.addObject("users", us.findEmpNameManagerNameEmpGroupDesc());
		return m;
	}

	/*
	 * Access Add user page
	 */
	@GetMapping(value = "/user-master-add")
	public ModelAndView getUserMasterAdd() {
		ModelAndView m = new ModelAndView("user-master-add");
		m.addObject("userGroupList", ((List<UserGroup>) uGR.findAll()));
		m.addObject("empList", (List<Employee>) er.findAllEmployeeNotMapUser());
		m.addObject("managerList", (List<Employee>) er.findAllEmployeeMapUser());
		return m;
	}

	/*
	 * Adding user post request
	 */
	@PostMapping(value = "/user-master-add-process")
	public ResponseEntity<Object> addUser(@RequestBody User user) {
		UserGroupMapping ugm = new UserGroupMapping();
		UserGroup ug = uGR.findByUgrpCode(Integer.valueOf(user.getRoles()));
		String r = ug.getUgrpDesc().replace(" ", "_");
		user.setRoles(r);
		user.setUsername(String.valueOf(user.getEmpId()));
		ugm.setUgrpCode(ug.getUgrpCode());
		ugm.setEmpId(user.getEmpId());
		ugm.setCreatedTime(new SimpleDateFormat("yyy-MM-dd").format(new java.util.Date()));
		ugm.setCreatedBy(ugm.getCreatedBy());
		ur.save(user);
		ur.updateUserPassword(user.getEmpId(), user.getPassword());
		ugmr.save(ugm);
		return ResponseEntity.status(HttpStatus.CREATED).body("");
	}

	/*
	 * Access user edit page
	 */
	@GetMapping(value = "/user-master-edit")
	public String getUserMasterEdit(Model m, @RequestParam(name = "empId", defaultValue = "") Employee emp) {
		if (emp == null) {
			return "redirect:user-master";
		}
		Optional<User> em = ur.findById(emp.getEmpId());
		User user = em.get();
		m.addAttribute("user", user);
		m.addAttribute("empList", (List<Employee>) er.findAll());
		m.addAttribute("managerList", (List<Employee>) er.findAllEmployeeMapUser());
		m.addAttribute("empUgrpCode", ugmr.findUgrpCodeByEmpId(emp.getEmpId()));
		m.addAttribute("userGroupList", ((List<UserGroup>) uGR.findAll()));
		return "user-master-edit";
	}

	/*
	 * Edit user post request
	 */
	@PostMapping(value = "user-master-edit-process")
	public ResponseEntity<Object> getuserMasterEditProcess(Model m, @RequestBody User user) {
		UserGroupMapping ugm = ugmr.findByEmpId(user.getEmpId());
		UserGroup ug = uGR.findByUgrpCode(Integer.valueOf(user.getRoles()));
		String r = ug.getUgrpDesc().replace(" ", "_");
		System.out.println(r);
		ur.updateUserDetails(user.getEmpId(), user.getManagerId(), user.getLeaveReportingManager(),
				user.getLeaveManager(), user.getActive(), r);
		ur.updateUserPassword(user.getEmpId(), user.getPassword());
		ugm.setUgrpCode(ug.getUgrpCode());
		ugm.setModifiedBy(String.valueOf(user.getEmpId()));
		SimpleDateFormat sdf = new SimpleDateFormat("yyy-MM-dd");
		String date = sdf.format(new java.util.Date());
		ugm.setModifiedTime(date);
		ugm.setCreatedBy(ugm.getCreatedBy());
		ugm.setCreatedTime(ugm.getCreatedTime());
		ugmr.save(ugm);
		return ResponseEntity.ok().body("Ok");
	}

	/*
	 * Access Forget password page
	 */
	@GetMapping(value = "forget-pass-emp")
	public ModelAndView forgetPasswordEmp() {
		ModelAndView m = new ModelAndView("forget-pass-emp");
		m.addObject("emp", es.findEmployeeName());
		return m;
	}

	/*
	 * Edit user password post request
	 */
	@PostMapping(value = "forget-pass-emp")
	public String forgetPasswordEmpP(@ModelAttribute User user) {
		ur.updateUserPassword(user.getEmpId(), user.getPassword());
		return "redirect:/forget-pass-emp";
	}

	@GetMapping(value = "/table")
	public String getTable() {
		return "table";
	}

	@GetMapping("/get-user/{id}")
	public ResponseEntity<User> getUser(@PathVariable Long id) {
		return ResponseEntity.of(ur.findById(id));
	}

	@GetMapping("/get-employee/{id}")
	public ResponseEntity<Employee> getEmployee(@PathVariable Long id) {
		return ResponseEntity.of(er.findById(id));
	}

	@GetMapping("/get-employee1/{firstname}.{lastname}")
	public ResponseEntity<Object> getEmployeeCheck(@PathVariable String lastname) {
		System.out.println();
		return ResponseEntity.of(Optional.of(lastname));
	}

}
