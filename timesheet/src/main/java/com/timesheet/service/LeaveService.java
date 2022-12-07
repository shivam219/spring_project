package com.timesheet.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

	public String getLeaveId() {
		return lr.getLeaveId();
	}

	public List<Leave> getCancleLeave(long l) {
		return lr.getCancleLeaveByEmpId(l);
	}

	public int updateCancleStatus(Leave leave) {
		if (lr.updateCancleStatus(leave.getLeaveId()) == 1) {
			if (leave.getSecondStatus().equals("Approved")) {
				es.leaveCancelRequestToEmployee(leave, er.findEmpEmailByEmpId(leave.getEmpId()));
				es.leaveCancelRequestToServiceDesk(leave, er.findEmpEmailByEmpId(leave.getEmpId()));
				// need change with services desk
				if (leave.getManagerId().equals(leave.getLeaveManagerId())) {
					es.leaveCancelRequestToApprover(leave, er.findEmpEmailByEmpId(leave.getManagerId()),
							leave.getManagerName());
				} else {
					String managerName = er.findEmployeeName(leave.getLeaveManagerId());
					es.leaveCancelRequestToApprover(leave, er.findEmpEmailByEmpId(leave.getManagerId()),
							leave.getManagerName());
					es.leaveCancelRequestToApprover(leave, er.findEmpEmailByEmpId(leave.getLeaveManagerId()),
							managerName);
				}
			} else if (leave.getSecondStatus().equals("Pending")) {
				es.leaveCancelRequestToEmployee(leave, er.findEmpEmailByEmpId(leave.getEmpId()));
				if (leave.getManagerId().equals(leave.getLeaveManagerId())) {
					es.leaveCancelRequestToApprover(leave, er.findEmpEmailByEmpId(leave.getManagerId()),
							leave.getManagerName());
				} else {
					String managerName = er.findEmployeeName(leave.getLeaveManagerId());
					es.leaveCancelRequestToApprover(leave, er.findEmpEmailByEmpId(leave.getManagerId()),
							leave.getManagerName());
					es.leaveCancelRequestToApprover(leave, er.findEmpEmailByEmpId(leave.getLeaveManagerId()),
							managerName);
				}
			} else if (leave.getStatus().equals("Pending")) {
				es.leaveCancelRequestToEmployee(leave, er.findEmpEmailByEmpId(leave.getEmpId()));
				es.leaveCancelRequestToApprover(leave, er.findEmpEmailByEmpId(leave.getManagerId()),
						leave.getManagerName());

			}

//			es.leaveCancelRequestToEmployee(leave, er.findEmpEmailByEmpId(leave.getEmpId()));
//			if (leave.getManagerId() != null && !leave.getManagerId().equals("")) {
//				es.leaveCancelRequestToEmployee(leave, er.findEmpEmailByEmpId(leave.getManagerId()));
//			}
//			if (leave.getLeaveManagerId() != null && !leave.getLeaveManagerId().equals("")) {
//				es.leaveCancelRequestToApprover(leave, er.findEmpEmailByEmpId(leave.getLeaveManagerId()));
//			}
			return 1;
		}
		return 0;
	}

}