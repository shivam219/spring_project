package com.timesheet.service;

import java.math.BigInteger;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;
import java.util.stream.Collectors;

import javax.persistence.Tuple;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.timesheet.dto.LeaveDetailsDto;
import com.timesheet.dto.LeaveDto;
import com.timesheet.dto.LeaveStatusDto;
import com.timesheet.model.Leave;
import com.timesheet.repository.EmployeeRepository;
import com.timesheet.repository.LeaveRepository;

@Service
public class LeaveService {

	@Autowired
	private LeaveRepository lr;

	@Autowired
	public EmployeeRepository er;
	@Autowired
	private EmailService es;

	public List<Leave> getAllLeave() {
		return (List<Leave>) lr.findAll();
	}

	public void sendEmailOnSubmit(Leave l) {
		this.es.leaveSubmitEmailToEmployee(l, er.findEmpEmailByEmpId(l.getEmpId()));
		this.es.leaveSubmitEmailToApprover(l, er.findEmpEmailByEmpId(l.getManagerId()));
	}

	public List<Leave> getCancleLeave(long l) {
		return lr.getCancleLeaveByEmpId(l);
	}

	public int updateCancleStatus(Leave leave) {
		if (lr.updateCancleStatus(leave.getLeaveId()) == 1) {
			if (leave.getSecondStatus().equals("Approved")) {
				ExecutorService executor = Executors.newWorkStealingPool();
				executor.execute(() -> {
					es.leaveCancelRequestToEmployee(leave, er.findEmpEmailByEmpId(leave.getEmpId()));
					es.leaveCancelRequestToServiceDesk(leave);
				});
				if (leave.getManagerId().equals(leave.getLeaveManagerId())) {
					ExecutorService e2 = Executors.newWorkStealingPool();
					e2.execute(() -> {
						es.leaveCancelRequestToApprover(leave, er.findEmpEmailByEmpId(leave.getManagerId()),
								leave.getManagerName());
					});
				} else {
					String managerName = er.findEmployeeName(leave.getLeaveManagerId());
					ExecutorService e2 = Executors.newWorkStealingPool();
					e2.execute(() -> {
						es.leaveCancelRequestToApprover(leave, er.findEmpEmailByEmpId(leave.getManagerId()),
								leave.getManagerName());
						es.leaveCancelRequestToApprover(leave, er.findEmpEmailByEmpId(leave.getLeaveManagerId()),
								managerName);
					});
				}
			} else if (leave.getSecondStatus().equals("Pending")) {
				ExecutorService executor = Executors.newWorkStealingPool();
				executor.execute(() -> {
					es.leaveCancelRequestToEmployee(leave, er.findEmpEmailByEmpId(leave.getEmpId()));
				});
				if (leave.getLeaveManagerId() == null || leave.getLeaveManagerId() == 0) {
					ExecutorService e2 = Executors.newWorkStealingPool();
					e2.execute(() -> {
						es.leaveCancelRequestToApprover(leave, er.findEmpEmailByEmpId(leave.getManagerId()),
								leave.getManagerName());
					});
				} else if (leave.getManagerId().equals(leave.getLeaveManagerId())) {
					ExecutorService e2 = Executors.newWorkStealingPool();
					e2.execute(() -> {

						es.leaveCancelRequestToApprover(leave, er.findEmpEmailByEmpId(leave.getManagerId()),
								leave.getManagerName());
					});
				} else {
					String managerName = er.findEmployeeName(leave.getLeaveManagerId());
					ExecutorService e2 = Executors.newWorkStealingPool();
					e2.execute(() -> {
						es.leaveCancelRequestToApprover(leave, er.findEmpEmailByEmpId(leave.getManagerId()),
								leave.getManagerName());
						es.leaveCancelRequestToApprover(leave, er.findEmpEmailByEmpId(leave.getLeaveManagerId()),
								managerName);
					});
				}
			} else if (leave.getStatus().equals("Pending")) {
				ExecutorService executor = Executors.newWorkStealingPool();
				executor.execute(() -> {
					es.leaveCancelRequestToEmployee(leave, er.findEmpEmailByEmpId(leave.getEmpId()));
					es.leaveCancelRequestToApprover(leave, er.findEmpEmailByEmpId(leave.getManagerId()),
							leave.getManagerName());
				});
			}
			return 1;
		}
		return 0;
	}

	public List<LeaveDto> findLeaveTypeStartDateEndDateByEmpId(long empId) {
		List<Tuple> tu = lr.findLeaveTypeStartDateEndDateByEmpId(empId);
		List<LeaveDto> ld = tu.stream().map(e -> new LeaveDto(e.get(0, String.class), e.get(1, String.class),
				e.get(2, String.class), e.get(3, String.class))).collect(Collectors.toList());
		return ld;
	}

	public List<LeaveDto> findLeaveTypeStartDateEndDateByEmpIdForMonth(long empId, long monthSheetId) {
		List<Tuple> tu = lr.findLeaveTypeStartDateEndDateByEmpIdForMonth(empId, monthSheetId);
		List<LeaveDto> ld = tu.stream().map(e -> new LeaveDto(e.get(0, String.class), e.get(1, String.class),
				e.get(2, String.class), e.get(3, String.class))).collect(Collectors.toList());
		return ld;
	}

	public List<LeaveDetailsDto> getLeaveByMonthAndYear2(String month, String year) {
		List<Tuple> tu = lr.getLeaveByMonthAndYear2(month, year);
		List<LeaveDetailsDto> ld = tu.stream()
				.map(e -> new LeaveDetailsDto(e.get(0, String.class), e.get(1, BigInteger.class),
						e.get(2, String.class), e.get(3, String.class), e.get(4, String.class), e.get(5, String.class),
						e.get(6, String.class), e.get(7, String.class), e.get(8, String.class)))
				.collect(Collectors.toList());
		return ld;
	}

	public List<LeaveDetailsDto> getEmploeeWiseReport(String month, String year, long empId, String status) {
		List<Tuple> tu = lr.getEmploeeWiseReport2(month, year, empId, status);
		List<LeaveDetailsDto> ld = tu.stream()
				.map(e -> new LeaveDetailsDto(e.get(0, String.class), e.get(1, BigInteger.class),
						e.get(2, String.class), e.get(3, String.class), e.get(4, String.class), e.get(5, String.class),
						e.get(6, String.class), e.get(7, String.class), e.get(8, String.class)))
				.collect(Collectors.toList());
		return ld;
	}

	public List<LeaveDetailsDto> getPendingLeaveByMonthAndYear2(String month, String year) {
		List<Tuple> tu = lr.getPendingLeaveByMonthAndYear2(month, year);
		List<LeaveDetailsDto> ld = tu.stream()
				.map(e -> new LeaveDetailsDto(e.get(0, String.class), e.get(1, BigInteger.class),
						e.get(2, String.class), e.get(3, String.class), e.get(4, String.class), e.get(5, String.class),
						e.get(6, String.class), e.get(7, String.class), e.get(8, String.class)))
				.collect(Collectors.toList());
		return ld;
	}

	public List<LeaveStatusDto> findLeaveStatusByEmpId(long empId) {
		List<Tuple> tu = lr.findLeaveStatusByEmpId(empId);
		List<LeaveStatusDto> ld = tu
				.stream().map(e -> new LeaveStatusDto(e.get(0, String.class), e.get(1, String.class),
						e.get(2, String.class), e.get(3, String.class), e.get(4, String.class)))
				.collect(Collectors.toList());
		return ld;
	}
//	

}
