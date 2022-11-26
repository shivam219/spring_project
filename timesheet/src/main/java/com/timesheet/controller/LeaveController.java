package com.timesheet.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.timesheet.model.Employee;
import com.timesheet.model.Leave;
import com.timesheet.repository.EmployeeRepository;
import com.timesheet.repository.LeaveRepository;
import com.timesheet.repository.UserRepository;
import com.timesheet.service.ApproveService;
import com.timesheet.service.EmailService;
import com.timesheet.service.LeaveService;
import com.timesheet.service.ReportService;

@Controller
public class LeaveController {

	@Autowired
	private LeaveService leaveService;

	@Autowired
	public ApproveService approveService;

	@Autowired
	public EmailService emailService;
	@Autowired
	LeaveRepository leaveRepository;

	@Autowired
	EmployeeRepository er;

	@Autowired
	UserRepository ur;

	String month = "";
	String year = "";

	@GetMapping(value = "apply-leave")
	public ModelAndView applyLeave(HttpServletRequest request) {
		ModelAndView m = new ModelAndView("applyleave");
		Long empId = ((Long) request.getSession().getAttribute("empId"));
		Employee emp = er.findById(empId).get();
		m.addObject("emp", emp);
		m.addObject("manager", er.findById(Long.parseLong(ur.findById(empId).get().getManagerId())).get());
		return m;
	}

	@GetMapping(value = "approve-leave")
	public String approveLeave(Model m, HttpServletRequest request) {
		Long empId = ((Long) request.getSession().getAttribute("empId"));
		m.addAttribute("leaveList", approveService.leaveList("" + empId, "Pending"));
		return new String("approveleave");
	}

	@GetMapping(value = "cancle-leave")
	public String cancleLeave(Model m, HttpServletRequest request) {
		String empId = ((Long) request.getSession().getAttribute("empId")) + "";
		m.addAttribute("getAllLeave", leaveService.getCancleLeave(empId));
		return new String("cancleleave");
	}

	@GetMapping("/leave-report")
	public String leaveReport(Model m, HttpServletRequest request) {
//		m.addAttribute("leaveList", leaveRepository.getLeaveByMonthAndYear());
		return "leavereport";
	}

	@PostMapping("/leave-report")
	public String leaveReportFetch(Model m, @RequestParam("leaveMonth") String month,
			@RequestParam("leaveYear") String year) {
		this.month = month;
		this.year = year;
		m.addAttribute("month", month);
		m.addAttribute("year", year);
		m.addAttribute("leaveList", leaveRepository.getLeaveByMonthAndYear(month, year));
		return "leavereport";
	}

	@PostMapping(value = "/applyleaveprocess")
	public String applyleaveprocess(HttpServletRequest request, Model model, @ModelAttribute Leave la) {
		System.out.println(la);
		la.setStatus("Pending");
		leaveRepository.save(la);
		return "redirect:/home";
	}

	@PostMapping(value = "/approve-leave-process")
	public ResponseEntity<Object> approveleaveprocess(HttpServletRequest request, Model model, @RequestBody Leave la) {
		approveService.updateApproveStatus(la);
		System.out.println(la);
		try {
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.ACCEPTED).body("Leave approve");
	}

	@PostMapping(value = "/reject-leave-process")
	public String rejectleaveprocess(HttpServletRequest request, Model model, @RequestBody Leave la) {
		approveService.updateRejectStatus(la);
		System.out.println(la);
		try {
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/home";
	}

	@PostMapping(value = "/cancle-leave-process")
	public ResponseEntity<Object> cancleleaveprocess(HttpServletRequest request, Model model, @RequestBody Leave la) {
		System.out.println(la);
		leaveService.updateCancleStatus(la);
		try {
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.ACCEPTED).body("Leave Cancelled");
	}

	@GetMapping("/download/leave.xlsx")
	public void download(HttpServletResponse response, @RequestParam("month") String month,
			@RequestParam("year") String year) throws IOException {
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition", "attachment; filename=customers.xlsx");
		ByteArrayInputStream stream = ReportService.contactListToExcelFile(Data());
		System.out.println(month);
		System.out.println(year);
		IOUtils.copy(stream, response.getOutputStream());
	}

	private List<Leave> Data() {
		List<Leave> leave = leaveRepository.getLeaveByMonthAndYear(month, year);
		System.out.println(leave);
		return leave;

	}
}
