package com.timesheet.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.concurrent.TimeUnit;

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
import com.timesheet.repository.ApproveRepository;
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
	public LeaveRepository lr;

	@Autowired
	public EmployeeRepository er;

	@Autowired
	public UserRepository ur;

	@Autowired
	public ApproveRepository ar;

	String month = "";
	String year = "";
	long empId = 0;
	String status = "";

	/*
	 * accessing apply leave and sending data to current
	 * page----------------------------------------------------
	 */

	@GetMapping(value = "apply-leave")
	public ModelAndView applyLeave(HttpServletRequest request) {
		ModelAndView m = new ModelAndView("applyleave");
		Long empId = ((Long) request.getSession().getAttribute("empId"));
		Employee emp = er.findById(empId).get();
		m.addObject("emp", emp);
		m.addObject("manager", er.findById(Long.parseLong(ur.findById(empId).get().getLeaveReportingManager())).get());
		return m;
	}

	@PostMapping(value = "/applyleaveprocess")
	public String applyleaveprocess(HttpServletRequest request, Model model, @ModelAttribute Leave la) {
		la.setStatus("Pending");
		lr.save(la);
		return "redirect:/home";
	}

	@PostMapping(value = "/apply-leave-process")
	public ResponseEntity<Object> applyLeaveProcess(HttpServletRequest request, @RequestBody Leave leave) {
		Long empId = ((Long) request.getSession().getAttribute("empId"));
		Employee emp = er.findById(empId).get();
		Employee manager = er.findById(Long.parseLong(ur.findById(empId).get().getLeaveReportingManager())).get();
		leave.setStatus("Pending");
		leave.setEmpId(empId);
		leave.setEmpName(emp.getFullName());
		leave.setManagerId(manager.getEmpId());
		leave.setManagerName(manager.getFullName());
		System.out.println(leave);
		System.out.println(lr.save(leave));
		return ResponseEntity.status(HttpStatus.ACCEPTED).body("Apply Leave success");
	}

//	@PostMapping(value = "/applyleaveprocess")
//	public String applyleaveprocess(HttpServletRequest request, Model model, @ModelAttribute Leave l) {
//		Long empId = ((Long) request.getSession().getAttribute("empId"));
//		Employee emp = er.findById(empId).get();
//		l.setEmpId(String.valueOf(emp.getEmpId()));
//		l.setEmpName(emp.getFirstName() + " " + emp.getLastName());
//		Employee manager = er.findById(Long.parseLong(ur.findById(empId).get().getLeaveReportingManager())).get();
//		l.setManagerId(String.valueOf(manager.getEmpId()));
//		l.setManagerName(manager.getFirstName() + " " + manager.getLastName());
//		l.setStatus("Pending");
//		if (l.getEndDate() == null || l.getEndDate().equals("")) {
//			l.setEndDate(l.getStartDate());
//		}
//		leaveService.save(l);
//		l.setLeaveId(leaveService.getLeaveId());
//		leaveService.EmailOnSubmit(l);
//		return "redirect:/home";
//	}

	@GetMapping(value = "approve-leave")
	public String approveLeave(HttpServletRequest request, Model m) {
		Long empId = (Long) request.getSession().getAttribute("empId");
		List<Leave> ll = ar.findAllFirstManagerList(String.valueOf(empId), "Pending");
		ll.addAll(ar.findAllLastManagerList(String.valueOf(empId), String.valueOf(empId), "Pending"));
		m.addAttribute("leaveList", ll);
		return "approveleave";

	}

	@PostMapping(value = "/approve-leave-process")
	public ResponseEntity<Object> approveleaveprocess(HttpServletRequest request, Model model, @RequestBody Leave la) {
		Leave le = lr.findById(Long.parseLong(la.getLeaveId().substring(1, la.getLeaveId().length()))).get();
 
		le.setLeaveManagerId(Long.parseLong((ar.getApproveMangerCode(le.getEmpId()).get(0)[0])));
		try {

			if (le.getSecondStatus() != null && le.getSecondStatus().equals("Pending")) {
				le.setSecondApproveReason(la.getApproveReason());
				if (!le.getManagerId().equals(le.getLeaveManagerId())) {
					le.setSecondStatus("Approved");
				}
			}

			if (le.getStatus().trim().equals("Pending")) {
				le.setApproveReason(la.getApproveReason());
				le.setStatus("Approved");
				if (le.getManagerId().equals(le.getLeaveManagerId())) {
					le.setSecondStatus("Approved");
				} else {
					le.setSecondStatus("Pending");
				}
			}
			Leave l = lr.save(le);
			if (l.getSecondStatus().equals("Approved")) {
				emailService.LeaveApproveToEmployee(le, "sandeep.gupta@ess.net.in");
				emailService.LeaveApproveToServicedesk(le);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.ACCEPTED).body("Leave approve");
	}

	@GetMapping(value = "cancle-leave")
	public String cancleLeave(Model m, HttpServletRequest request) {
		String empId = ((Long) request.getSession().getAttribute("empId")) + "";
		m.addAttribute("getAllLeave", leaveService.getCancleLeave(empId));
		return new String("cancleleave");
	}

	@PostMapping(value = "/cancle-leave-process")
	public ResponseEntity<Object> cancleleaveprocess(HttpServletRequest request, Model model, @RequestBody Leave la) {
		leaveService.updateCancleStatus(la);
		try {
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.ACCEPTED).body("Leave Cancelled");
	}

	@PostMapping(value = "/reject-leave-process")
	public ResponseEntity<Object> rejectleaveprocess(HttpServletRequest request, Model model, @RequestBody Leave la) {
		try {
			approveService.updateRejectStatus(la, request);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.ACCEPTED).body("Leave Reject");
	}

	@GetMapping(value = "leave-console")
	public String leaveStatus(Model m) {
		m.addAttribute("list", lr.getLeaveStatus());
		return new String("leave-console");
	}

	/*
	 * Approved Leave Report
	 * Mapping----------------------------------------------------------------------
	 */
	@GetMapping("/leave-report")
	public String leaveReport(Model m, HttpServletRequest request) {
		return "leavereport";
	}

	@PostMapping("/leave-report")
	public String leaveReportFetch(Model m, @RequestParam("leaveMonth") String month,
			@RequestParam("leaveYear") String year) throws Exception {
		this.month = month;
		this.year = year;
		m.addAttribute("month", month);
		m.addAttribute("year", year);
		int i = 0;
		String[] days = new String[lr.getLeaveByMonthAndYear(month, year).size()];
		for (Leave l : lr.getLeaveByMonthAndYear(month, year)) {
			if (l.getDayMode().contains("Half Day")) {
				days[i] = "0.5";
			} else {

				days[i] = (Math.abs(TimeUnit.MILLISECONDS
						.toDays(((new SimpleDateFormat("yyyy-MM-dd").parse(l.getStartDate()).getTime())
								- (new SimpleDateFormat("yyyy-MM-dd").parse(l.getEndDate()).getTime()))))
						+ 1) + "";
			}
			i++;
		}
		m.addAttribute("leaveList", lr.getLeaveByMonthAndYear(month, year));
		m.addAttribute("days", days);

		return "leavereport";
	}

	/*
	 * Approved Leave Status Data Exporting into Excel
	 * Sheet----------------------------------------------
	 */
	@GetMapping("/download/leave.xlsx")
	public void download(HttpServletResponse response, @RequestParam("month") String month,
			@RequestParam("year") String year) throws IOException {
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition", "attachment; filename=MonthlyLeaveReport.xlsx");
		ByteArrayInputStream stream = ReportService.contactListToExcelFile(Data());
		System.out.println(month);
		System.out.println(year);
		IOUtils.copy(stream, response.getOutputStream());
	}

	private List<Leave> Data() {
		List<Leave> leave = lr.getLeaveByMonthAndYear(month, year);
		System.out.println(leave);
		return leave;

	}

	/*
	 * Employee Wise Leave Report Mapping to
	 * Server-------------------------------------------------------
	 */
	@GetMapping("/employee-wise-report")
	public String employeeWiseLeaveReport(Model m, HttpServletRequest request) {
		m.addAttribute("empId", "");
		m.addAttribute("employeeList", er.findAll());
		return "employee-wise-report";
	}

	@PostMapping("/employee-wise-report")
	public String employeeWiseLeaveReportFetch(Model m, @RequestParam("leaveMonth") String month,
			@RequestParam("leaveYear") String year, @RequestParam("leaveEmployee") long empId,
			@RequestParam("leaveStatus") String status, String empname) throws Exception {
		this.month = month;
		this.year = year;
		this.empId = empId;
		this.status = status;
		m.addAttribute("month", month);
		m.addAttribute("year", year);
		m.addAttribute("empId", empId);
		m.addAttribute("status", status);
		int i = 0;
		String[] days = new String[lr.getEmploeeWiseReport(month, year, empId, status).size()];
		for (Leave l : lr.getEmploeeWiseReport(month, year, empId, status)) {
			if (l.getDayMode().contains("Half Day")) {
				days[i] = "0.5";
			} else {

				days[i] = (Math.abs(TimeUnit.MILLISECONDS
						.toDays(((new SimpleDateFormat("yyyy-MM-dd").parse(l.getStartDate()).getTime())
								- (new SimpleDateFormat("yyyy-MM-dd").parse(l.getEndDate()).getTime()))))
						+ 1) + "";
			}
			i++;
		}
		m.addAttribute("leaveList", lr.getEmploeeWiseReport(month, year, empId, status));
		m.addAttribute("employeeList", er.findAll());
		m.addAttribute("days", days);

		return "employee-wise-report";
	}

	/*
	 * Employee Wise Leave Status Data Exporting into Excel
	 * Sheet------------------------------------------------
	 */
	@GetMapping("/download2/leave.xlsx")
	public void download3(HttpServletResponse response, @RequestParam("month") String month,
			@RequestParam("year") String year, @RequestParam("leaveEmployee") long empId,
			@RequestParam("leaveStatus") String status) throws IOException {
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition", "attachment; filename=PendingLeaveReoprt.xlsx");
		ByteArrayInputStream stream = ReportService.contactListToExcelFile(Data3());
		IOUtils.copy(stream, response.getOutputStream());
	}

	private List<Leave> Data3() {
		List<Leave> leave = lr.getEmploeeWiseReport(month, year, empId, status);
		System.out.println(leave);
		return leave;

	}

	/*
	 * Pending Leave Report
	 * Mapping---------------------------------------------------------------------
	 */
	@GetMapping("/pending-leave-report")
	public String pendingLeaveReport(Model m, HttpServletRequest request) {
		return "pending-leave-report";
	}

	@PostMapping("/pending-leave-report")
	public String pendingLeaveReportFetch(Model m, @RequestParam("leaveMonth") String month,
			@RequestParam("leaveYear") String year) throws Exception {
		this.month = month;
		this.year = year;
		m.addAttribute("month", month);
		m.addAttribute("year", year);
		int i = 0;
		String[] days = new String[lr.getPendingLeaveByMonthAndYear(month, year).size()];
		for (Leave l : lr.getPendingLeaveByMonthAndYear(month, year)) {
			if (l.getDayMode().contains("Half Day")) {
				days[i] = "0.5";
			} else {

				days[i] = (Math.abs(TimeUnit.MILLISECONDS
						.toDays(((new SimpleDateFormat("yyyy-MM-dd").parse(l.getStartDate()).getTime())
								- (new SimpleDateFormat("yyyy-MM-dd").parse(l.getEndDate()).getTime()))))
						+ 1) + "";
			}
			i++;
		}

		m.addAttribute("pendingList", lr.getPendingLeaveByMonthAndYear(month, year));
		m.addAttribute("days", days);

		return "pending-leave-report";
	}

	/*
	 * Pending Leave Status Data Exporting into Excel
	 * Sheet------------------------------------------------
	 */
	@GetMapping("/download1/leave.xlsx")
	public void download1(HttpServletResponse response, @RequestParam("month") String month,
			@RequestParam("year") String year) throws IOException {
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition", "attachment; filename=PendingLeaveReoprt.xlsx");
		ByteArrayInputStream stream = ReportService.contactListToExcelFile(Data2());
		IOUtils.copy(stream, response.getOutputStream());
	}

	private List<Leave> Data2() {
		List<Leave> leave = lr.getPendingLeaveByMonthAndYear(month, year);
		System.out.println(leave);
		return leave;

	}

}