package com.timesheet.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.core.task.TaskExecutor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.timesheet.model.Employee;
import com.timesheet.model.Leave;
import com.timesheet.repository.ApproveRepository;
import com.timesheet.repository.EmployeeRepository;
import com.timesheet.repository.FinancialYearRepository;
import com.timesheet.repository.LeaveRepository;
import com.timesheet.repository.UserRepository;
import com.timesheet.service.ApproveService;
import com.timesheet.service.EmailService;
import com.timesheet.service.LeaveService;
import com.timesheet.service.ReportService;

@Controller
//@RequestMapping("/leave/")
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
	public FinancialYearRepository fyr;

	@Autowired
	private FileUploaderHelper fileUploaderHelper;

	@Autowired
	private TaskExecutor taskExecutor;

	@Autowired
	private Environment env;

	@GetMapping(value = "apply-leave")
	public ModelAndView applyLeave(HttpServletRequest request) {
		ModelAndView m = new ModelAndView("apply-leave");
		Long empId = ((Long) request.getSession().getAttribute("empId"));
		Employee emp = er.findById(empId).get();

		m.addObject("leaveTypes", lr.findLeaveType());
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
			@RequestParam String startDate, @RequestParam String endDate, @RequestParam MultipartFile file) {
		Long empId = ((Long) request.getSession().getAttribute("empId"));
		if (lr.existsByEmpIdAndStartDate(empId, startDate, endDate) != null) {
			return ResponseEntity.status(HttpStatus.FORBIDDEN).body("Duplicate Leave");
		}
		if (!file.isEmpty()) {
			if (!file.getContentType().equals("application/pdf") && !file.getContentType().equals("image/jpeg")
					&& !file.getContentType().equals("image/png")) {
				return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("file type not supported");
			} else {
				if (fileUploaderHelper.uploadFile(file)) {
//					System.out.println(file.getOriginalFilename());
//					if (!file.getContentType().equals("image/jpeg") && !file.getContentType().equals("image/png"))
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
				ExecutorService executor = Executors.newWorkStealingPool();
				executor.execute(() -> {
					ls.sendEmailOnSubmit(saveLeave);
				});
			} else {
				ExecutorService executor = Executors.newWorkStealingPool();
				executor.execute(() -> {
					ls.sendEmailOnSubmit(saveLeave);
				});
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
				ExecutorService executor = Executors.newWorkStealingPool();
				executor.execute(() -> {
					es.LeaveApproveToEmployee(le, er.findEmpEmailByEmpId(l.getEmpId()));
					es.LeaveApproveToServicedesk(le);
				});
			} else if (l.getSecondStatus().equals("Pending")) {
				String secondMangerName = er.findEmployeeName(l.getLeaveManagerId());
				String secManEmail = er.findEmpEmailByEmpId(l.getLeaveManagerId());
				ExecutorService executor = Executors.newWorkStealingPool();
				executor.execute(() -> {
					es.LeaveApproveToSecondManager(le, secManEmail, secondMangerName);
				});
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
		return "cancleleave";
	}

	@PostMapping(value = "/cancle-leave-process")
	public ResponseEntity<Object> cancleleaveprocess(HttpServletRequest request, Model model, @RequestBody Leave l) {
		Long empId = ((Long) request.getSession().getAttribute("empId"));
		Leave leave = lr.findByEmpIdAndLeaveId(empId, l.getLeaveId());
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
	public ModelAndView leaveStatus(HttpServletRequest request) {
		Long empId = ((Long) request.getSession().getAttribute("empId"));
		ModelAndView m = new ModelAndView("leave-console");
		m.addObject("list", lr.getLeaveStatus(empId));
		return m;
	}

	@GetMapping("leave-details")
	public ModelAndView getEmployeeMaster(HttpServletRequest request,
			@RequestParam(value = "page", defaultValue = "1") Integer page,
			@RequestParam(value = "status", defaultValue = "") String status,
			@RequestParam(value = "startDate", defaultValue = "") String startDate,
			@RequestParam(value = "endDate", defaultValue = "") String endDate) throws ParseException {
		long empId = (long) request.getSession().getAttribute("empId");
		ModelAndView m = new ModelAndView("leave-details");
		Pageable pageable = PageRequest.of((page - 1), 8, Sort.by("startDate"));
		Page<Leave> lp = null;
		if (!startDate.equals("") && !endDate.equals("")) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date startDate2 = sdf.parse(startDate);
			Date endDate2 = sdf.parse(endDate);
			if (status.trim().isBlank()) {
				lp = (Page<Leave>) lr
						.findAllByStartDateGreaterThanEqualAndEndDateLessThanEqualAndEmpIdOrderByStartDateDesc(
								startDate2, endDate2, pageable, empId);
			} else {
				lp = (Page<Leave>) lr
						.findAllByStartDateGreaterThanEqualAndEndDateLessThanEqualAndSecondStatusAndEmpIdOrderByStartDateDesc(
								startDate2, endDate2, status, pageable, empId);
			}
//					    20022	!F  T			 	T	''
		} else if (!startDate.equals("") && endDate.equals("")) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date startDate2 = sdf.parse(startDate);
			if (status.trim().isBlank()) {
				lp = (Page<Leave>) lr.findAllByStartDateGreaterThanEqualAndEmpIdOrderByStartDateDesc(startDate2,
						pageable, empId);
			} else {
				lp = (Page<Leave>) lr.findAllByStartDateGreaterThanEqualAndEmpIdAndSecondStatusOrderByStartDateDesc(
						startDate2,empId, status,  pageable);
			}
		} else if (status == null || status.trim().isEmpty()) {
			lp = (Page<Leave>) lr.findAllByEmpIdOrderByStartDateDesc(pageable, empId);
		} else {
			lp = (Page<Leave>) lr.findBySecondStatusAndEmpIdOrderByStartDateDesc(status, pageable, empId);
		}
		List<Leave> ll = lp.getContent();
		m.addObject("option", status);
		m.addObject("startDate", startDate);
		m.addObject("endDate", endDate);
		m.addObject("list", ll);
		m.addObject("empListSize", lp.getTotalElements());
		m.addObject("currentPage", page);
		m.addObject("totalPages", (lp.getTotalPages()));
		return m;
	}

	/*
	 * Access Approved Leave Report
	 */
	@GetMapping("/leave-approve-report")
	public ModelAndView leaveReport() {
		ModelAndView m = new ModelAndView("leave-approve-report");
		m.addObject("months", er.findMonth());
		m.addObject("years", fyr.findYearDesc());
		return m;
	}

	/*
	 * Access Approved Leave Report
	 */
	@PostMapping("/leave-approve-report")
	public String leaveReportFetch(Model m, @RequestParam("leaveMonth") String month,
			@RequestParam("leaveYear") String year) throws Exception {
		m.addAttribute("month", month);
		m.addAttribute("year", year);
		m.addAttribute("months", er.findMonth());
		m.addAttribute("years", fyr.findYearDesc());
		m.addAttribute("leaveList", ls.getLeaveByMonthAndYear2(month, year));
		return "leave-approve-report";
	}

	/*
	 * Approved Leave Status Data Exporting into Excel
	 */
	@GetMapping("/approved/leave.xlsx")
	public void download(HttpServletResponse response, @RequestParam("month") String month,
			@RequestParam("year") String year) throws IOException {
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition", "attachment; filename=MonthlyLeaveReport.xlsx");
		ByteArrayInputStream stream = ReportService.contactListToExcelFile(lr.getLeaveByMonthAndYear(month, year));
		IOUtils.copy(stream, response.getOutputStream());
	}

	/*
	 * Access Pending Leave Report Page
	 */
	@GetMapping("/leave-pending-report")
	public ModelAndView pendingLeaveReport() {
		ModelAndView m = new ModelAndView("leave-pending-report");
		m.addObject("months", er.findMonth());
		m.addObject("years", fyr.findYearDesc());
		return m;
	}

	/*
	 * Access Pending Leave Report Page
	 */
	@PostMapping("/leave-pending-report")
	public String pendingLeaveReportFetch(Model m, @RequestParam("leaveMonth") String month,
			@RequestParam("leaveYear") String year) throws Exception {
		m.addAttribute("month", month);
		m.addAttribute("months", er.findMonth());
		m.addAttribute("year", year);
		m.addAttribute("years", fyr.findYearDesc());
		m.addAttribute("pendingList", ls.getPendingLeaveByMonthAndYear2(month, year));
		return "leave-pending-report";
	}

	/*
	 * Pending Leave Status Data Exporting into Excel Sheet
	 */
	@GetMapping("/pending/leave.xlsx")
	public void download1(HttpServletResponse response, @RequestParam("month") String month,
			@RequestParam("year") String year) throws IOException {
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition", "attachment; filename=PendingLeaveReoprt.xlsx");
		ByteArrayInputStream stream = ReportService
				.contactListToExcelFile(lr.getPendingLeaveByMonthAndYear(month, year));
		IOUtils.copy(stream, response.getOutputStream());
	}

	/*
	 * Employee Wise Leave Report Mapping to Server
	 */
	@GetMapping("/leave-employee-wise-report")
	public String employeeWiseLeaveReport(Model m, HttpServletRequest request) {
		m.addAttribute("empId", "");
		m.addAttribute("months", er.findMonth());
		m.addAttribute("years", fyr.findYearDesc());
		m.addAttribute("employeeList", er.findAll());
		return "leave-employee-wise-report";
	}

	@PostMapping("/leave-employee-wise-report")
	public String employeeWiseLeaveReportFetch(Model m, @RequestParam("leaveMonth") String month,
			@RequestParam("leaveYear") String year, @RequestParam("leaveEmployee") long empId,
			@RequestParam("leaveStatus") String status) throws Exception {
		m.addAttribute("month", month);
		m.addAttribute("year", year);
		m.addAttribute("months", er.findMonth());
		m.addAttribute("years", fyr.findYearDesc());

		m.addAttribute("empId", empId);
		m.addAttribute("status", status);

		m.addAttribute("leaveList", ls.getEmploeeWiseReport(month, year, empId, status));
		m.addAttribute("employeeList", er.findAll());
		return "leave-employee-wise-report";
	}

	/*
	 * Employee Wise Leave Status Data Exporting into Excel Sheet
	 */
	@GetMapping("/employee/leave.xlsx")
	public void download3(HttpServletResponse response, @RequestParam("month") String month,
			@RequestParam("year") String year, @RequestParam("empId") long empId, @RequestParam("status") String status)
			throws IOException {
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Disposition", "attachment; filename=PendingLeaveReoprt.xlsx");
		ByteArrayInputStream stream = ReportService
				.contactListToExcelFile(lr.getEmploeeWiseReport(month, year, empId, status));
		IOUtils.copy(stream, response.getOutputStream());
	}

}