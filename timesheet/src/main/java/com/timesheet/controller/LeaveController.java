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
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

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
	private LeaveService ls;

	@Autowired
	public ApproveService approveService;

	@Autowired
	public EmailService es;

	@Autowired
	public LeaveRepository lr;

	@Autowired
	public EmployeeRepository er;

	@Autowired
	public UserRepository ur;

	@Autowired
	public ApproveRepository ar;

	@Autowired
	private FileUploaderHelper fileUploaderHelper;

	String month = "";
	String year = "";
	long empId = 0;
	String status = "";

	@GetMapping(value = "apply-leave")
	public ModelAndView applyLeave(HttpServletRequest request) {
		ModelAndView m = new ModelAndView("apply-leave");
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

//	@RequestMapping(value = "/apply-leave-process", headers = ("content-type=multipart/*"), method = RequestMethod.POST, consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	@PostMapping(value = "/apply-leave-process")
	public ResponseEntity<Object> applyLeaveProcess(HttpServletRequest request, @ModelAttribute Leave leave,
			@RequestParam MultipartFile file) {
		Long empId = ((Long) request.getSession().getAttribute("empId"));
		if (lr.existsByEmpIdAndStartDate(empId, leave.getStartDate())) {
			return ResponseEntity.status(HttpStatus.FORBIDDEN).body("Duplicate Leave");
		}
		if (!file.isEmpty()) {
			if (!file.getContentType().equals("image/jpeg") && !file.getContentType().equals("image/png")) {
				return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("file type not supported");
			} else {
				if (fileUploaderHelper.uploadFile(file)) {
//					System.out.println(file.getOriginalFilename());
//					System.err.println(file.getSize());
//					System.err.println(file.getName());
//					System.err.println(file.getContentType());
					leave.setAttachment("images/" + file.getOriginalFilename());
					System.out.println(ServletUriComponentsBuilder.fromCurrentContextPath().path("/images/")
							.path(file.getOriginalFilename()).toUriString());
				}
			}
		}
		Employee emp = er.findById(empId).get();
		Employee manager = er.findById(Long.parseLong(ur.findById(empId).get().getLeaveReportingManager())).get();
		leave.setStatus("Pending");
		leave.setSecondStatus("Pending");
		leave.setEmpId(empId);
		leave.setEmpName(emp.getFullName());
		leave.setManagerId(manager.getEmpId());
		leave.setManagerName(manager.getFullName());
		try {
			Leave saveLeave = lr.save(leave);
			if (saveLeave.getLeaveId() == null || saveLeave.getLeaveId().equals("")) {
				StringBuilder leaveId = new StringBuilder("L");
				String ll = saveLeave.getLeaveCode() + "";
				int len = 9 - ll.length();
				for (int i = 1; i <= len; i++) {
					leaveId.append("0");
				}
				leaveId.append(saveLeave.getLeaveCode());
				saveLeave.setLeaveId(leaveId.toString());
				ls.sendEmailOnSubmit(saveLeave);
			} else {
				ls.sendEmailOnSubmit(saveLeave);
			}
			return ResponseEntity.status(HttpStatus.ACCEPTED).body("Apply Leave success");
		} catch (Exception e) {
			e.printStackTrace();
			return ResponseEntity.status(HttpStatus.FORBIDDEN).body("Error while Applying Leave");
		}
	}

	@GetMapping(value = "approve-leave")
	public String approveLeave(HttpServletRequest request, Model m) {
		Long empId = (Long) request.getSession().getAttribute("empId");
		List<Leave> ll = (ar.findAllLastManagerList(String.valueOf(empId), String.valueOf(empId), "Pending"));
		m.addAttribute("leaveList", ll);
		return "approveleave";
	}

	@PostMapping(value = "/approve-leave-process")
	public ResponseEntity<Object> approveleaveprocess(HttpServletRequest request, Model model, @RequestBody Leave la) {
		Leave le = lr.findByLeaveId(la.getLeaveId());
		le.setLeaveManagerId(Long.parseLong((ar.getApproveMangerCode(le.getEmpId()).get(0)[0])));
		try {
			if (le.getStatus().trim().equals("Pending")) {
				le.setApproveReason(la.getApproveReason());
				le.setStatus("Approved");
				if (le.getManagerId().equals(le.getLeaveManagerId())) {
					le.setSecondStatus("Approved");
				} else {
					le.setSecondStatus("Pending");
				}
			} else if (le.getSecondStatus() != null && le.getSecondStatus().equals("Pending")) {
				le.setSecondApproveReason(la.getApproveReason());
				if (!le.getManagerId().equals(le.getLeaveManagerId())) {
					le.setSecondStatus("Approved");
				}
			}
			Leave l = lr.save(le);
			if (l.getSecondStatus().equals("Approved")) {
				es.LeaveApproveToEmployee(le, er.findEmpEmailByEmpId(l.getEmpId()));
				es.LeaveApproveToServicedesk(le);
			} else if (l.getSecondStatus().equals("Pending")) {
				String secondMangerName = er.findEmployeeName(l.getLeaveManagerId());
				String secManEmail = er.findEmpEmailByEmpId(l.getLeaveManagerId());
				es.LeaveApproveToSecondManager(le, secManEmail, secondMangerName);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.ACCEPTED).body("Leave approve");
	}

	@GetMapping(value = "cancle-leave")
	public String cancleLeave(Model m, HttpServletRequest request) {
		long empId = (Long) request.getSession().getAttribute("empId");
		m.addAttribute("getAllLeave", ls.getCancleLeave(empId));
		return new String("cancleleave");
	}

	@PostMapping(value = "/cancle-leave-process")
	public ResponseEntity<Object> cancleleaveprocess(HttpServletRequest request, Model model, @RequestBody Leave leav) {
		Long empId = ((Long) request.getSession().getAttribute("empId"));
		Leave leave = lr.findByEmpIdAndLeaveId(empId, leav.getLeaveId());
		if (leave == null) {
			return ResponseEntity.status(HttpStatus.FORBIDDEN).body("Invalid Leave Cancallation");
		}
		try {
			ls.updateCancleStatus(leave);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ResponseEntity.status(HttpStatus.ACCEPTED).body("Leave Cancelled");
	}

	@PostMapping(value = "/reject-leave-process")
	public ResponseEntity<Object> rejectleaveprocess(HttpServletRequest request, @RequestBody Leave leave) {
		long empId = ((Long) request.getSession().getAttribute("empId"));
		String empName = request.getSession().getAttribute("empName").toString();
		Leave leavt = lr.findByLeaveId(leave.getLeaveId());
		if (leavt == null) {
			return ResponseEntity.status(HttpStatus.FORBIDDEN).body("Invalid Leave Cancallation");
		}
		if (leavt.getManagerId() != empId && leavt.getLeaveManagerId() != empId) {
			return ResponseEntity.status(HttpStatus.FORBIDDEN).body("Invalid Leave Cancallation");
		}
		try {
			leavt.setRejectReason(leave.getRejectReason());
			approveService.updateRejectStatus(leavt, empId, empName);
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
		m.addAttribute("leaveList", ls.getLeaveByMonthAndYear2(month, year));
		return "leavereport";
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
		m.addAttribute("leaveList", ls.getEmploeeWiseReport(month, year, empId, status));
		m.addAttribute("employeeList", er.findAll());
		return "employee-wise-report";
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
		m.addAttribute("pendingList", ls.getPendingLeaveByMonthAndYear2(month, year));
		return "pending-leave-report";
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

		IOUtils.copy(stream, response.getOutputStream());
	}

	private List<Leave> Data() {
		List<Leave> leave = lr.getLeaveByMonthAndYear(month, year);
		return leave;
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

		return leave;

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

		return leave;

	}

}