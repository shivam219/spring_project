package com.timesheet.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.timesheet.model.Employee;
import com.timesheet.model.ProjectRequest;
import com.timesheet.repository.CustomerRepository;
import com.timesheet.repository.EmployeeRepository;
import com.timesheet.repository.ProjectRepository;
import com.timesheet.repository.ProjectRequestRepository;
import com.timesheet.repository.UserRepository;
import com.timesheet.service.EmailService;

@RestController
public class ProjectRequestRestController {

	@Autowired
	CustomerRepository cr;

	@Autowired
	ProjectRepository pr;

	@Autowired
	ProjectRequestRepository prr;
	
	@Autowired
	UserRepository ur;

	@Autowired
	EmailService emailService;
	
	@Autowired
	EmployeeRepository er;


	@GetMapping(value = "/customer-projects")
	public ResponseEntity<List<String>> getOtp(@RequestParam("customerId") String customerId) {
		return ResponseEntity.of(Optional.of(pr.findProjectNameByCustomerId(customerId)));
	}

	@PostMapping("/project-request-process")
	public ResponseEntity<Object> projectrequestProcess (HttpServletRequest request,
			@RequestBody ProjectRequest pjtReq) throws Exception {
		pjtReq.setRequestedDate(new Date());
		Long empId = (Long) request.getSession().getAttribute("empId");
		pjtReq.setEmpId(empId);
		pjtReq.setManagerId( ur.findManagerIdByEmpId(empId));
		List<ProjectRequest> projectRequestData =  prr.findAllByEmpId(empId);
		boolean flag = false;
		for(ProjectRequest r : projectRequestData) {
//			r.setRequestedDate(new SimpleDateFormat("yyyy-mm-dd").parse(new SimpleDateFormat("yyyy-mm-dd").format(r.getRequestedDate())));
			if(r.equals(pjtReq)) {
				flag = true;
			}
		}
		if(flag) {
			return ResponseEntity.status(HttpStatus.CONFLICT).body("already apply for same request");
		}else {
			Employee emp = er.findById(empId).get();
			Long managerId = Long.parseLong(ur.findById(empId).get().getManagerId());
			Employee manager = er.findById(managerId).get();
			
//			+"<br>you will be notify if your manager will assign  "  
			String msgEmp = "Hii " + StringUtils.capitalize( emp.getFirstName()) +" " + StringUtils.capitalize(emp.getLastName()) 
			+"<br>Your request for projects "+ pjtReq.getProjectsList().toString().replace("[", "").replace("]", "").toUpperCase() +" ."
			+" <br> Is sended to manager" 
			+ "<br><br>This is an auto-generated Email."
			+ "<br>Do not reply to this email.<br> "
			;
			
			emailService.Email(emp.getEmpEmail(), "Project Request by " + StringUtils.capitalize(emp.getFirstName()) + " " + StringUtils.capitalize(emp.getLastName())  , msgEmp);
			String msgManager = "Hii " +  StringUtils.capitalize(manager.getFirstName()) +" " +  StringUtils.capitalize(manager.getLastName()) 
			+"<br><br>Employee Id : " + emp.getEmpId()  
			+"<br>Employee Name : " +  StringUtils.capitalize(emp.getFirstName()) + " " + StringUtils.capitalize(emp.getLastName())  
			+"<br>The employee has requested the following projects for their timesheet <br> "+ pjtReq.getProjectsList().toString().replace("[", "").replace("]", "").toUpperCase() +" ."
			+"<br>So assign that project to them."
			+"<br><br>This is an auto-generated Email."
			+ "<br>Do not reply to this email.<br> "
			;
			emailService.Email(manager.getEmpEmail(), "Project Request by " + StringUtils.capitalize(emp.getFirstName()) + " " + StringUtils.capitalize(emp.getLastName()) , msgManager);
			prr.save(pjtReq);
			return ResponseEntity.status(HttpStatus.ACCEPTED).body("Ok");
		}
	}

}
