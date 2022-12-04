package com.timesheet.controller;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.timesheet.model.Employee;
import com.timesheet.model.User;
import com.timesheet.model.UserGroup;
import com.timesheet.repository.EmployeeRepository;
import com.timesheet.repository.UserGroupRepository;
import com.timesheet.repository.UserRepository;
import com.timesheet.service.UserMasterService;

@Controller
public class UserController {

	@Autowired
	EmployeeRepository er;
	@Autowired
	UserGroupRepository uGR;
	@Autowired
	UserRepository ur;

	@Autowired
	UserMasterService us;

	@GetMapping(value = "/change-password")
	public String getMethodName() {
		return "change-password";
	}

	@PostMapping(value = "/change-password")
	public ResponseEntity<Object> changePassword(HttpServletRequest request,
			@RequestParam(value = "oldPass") String oldPass, @RequestParam(value = "newPass") String newPass) {
		String str = (String) request.getSession().getAttribute("empId").toString();
		Long empId = Long.valueOf(str);
		if (ur.existsByEmpIdAndPassword(empId, oldPass)) {
			er.updateEmployeePassword(1, newPass);
			return ResponseEntity.status(HttpStatus.ACCEPTED).body("password is updated successfully");
		}
		return ResponseEntity.status(HttpStatus.FORBIDDEN).body("Old Password is invalid");
	}

	@GetMapping(value = "user_gui")
	public String getMethoame() {
		return "user_gui";
	}

	@GetMapping(value = "/user-master")
	public ModelAndView userMaster() {
		ModelAndView m = new ModelAndView("user-master");
		m.addObject("users", us.findEmpNameManagerNameEmpGroupDesc());
		return m;
	}

	@GetMapping(value = "/user-master-add")
	public ModelAndView getUserMasterAdd() {
		ModelAndView m = new ModelAndView("user-master-add");
		m.addObject("empList", (List<Employee>) er.findAllEmployeeNotMapUser());
		m.addObject("managerList", (List<Employee>) er.findAllEmployeeMapUser());
		return m;
	}

	@PostMapping(value = "/user-master-add-process")
	public ResponseEntity<Object> addUser(@RequestBody User user) {
		ur.save(user);
		ur.updateUserPassword(user.getEmpId(), user.getPassword());
		return ResponseEntity.status(HttpStatus.CREATED).body("");
	}

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
		return "user-master-edit";
	}

	@PostMapping(value = "user-master-edit-process")
	public ResponseEntity<Object> getuserMasterEditProcess(Model m, @RequestBody User user) {
		ur.updateUserDetails(user.getEmpId(), user.getManagerId(), user.getLeaveReportingManager(),
				user.getLeaveManager(), user.getActive());
		ur.updateUserPassword(user.getEmpId(), user.getPassword());
		return ResponseEntity.ok().body("Ok");
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

}
