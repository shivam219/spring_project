package com.timesheet.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.timesheet.model.Leave;
import com.timesheet.repository.LeaveRepository;

@Service
public class LeaveService {

	@Autowired
	private LeaveRepository leaveRepository;

	@Autowired
	private EmailService emailService;

	public Leave save(Leave l) {
		System.out.println(leaveRepository.saveLeave(l.getEmpId(), l.getEmpName(), l.getManagerName(), l.getManagerId(),
				l.getDayMode(), l.getLeaveType(), l.getLeaveReason(), l.getStartDate(), l.getEndDate(),
				l.getAttachment(), l.getStatus(), l.getRejectReason()));
		return l;
	}

	public List<Leave> getAllLeave() {
		return (List<Leave>) leaveRepository.findAll();
	}

	public void EmailOnSubmit(Leave l) {
		this.emailService.leaveSubmitEmailToEmployee(l, "sandeep.gupta@ess.net.in");
		this.emailService.leaveSubmitEmailToApprover(l, "sandeep.gupta@ess.net.in");
	}

	public String getLeaveId() {
		return leaveRepository.getLeaveId();
	}

	public List<Leave> getCancleLeave(String l) {
		return leaveRepository.getCancleLeave(l);

	}

	public int updateCancleStatus(Leave leaveOld) {
		if (leaveRepository.updateCancleStatus(leaveOld.getLeaveId()) == 1) {
			Long lc = Long.valueOf(leaveOld.getLeaveId().substring(1));
			System.out.println(lc);
			Optional<Leave> l2 = leaveRepository.findById(lc);
			Leave leaveNew = l2.get();

			emailService.cancelRequestToEmployee(leaveNew, "sandeep.gupta@ess.net.in");
			emailService.cancelRequestToApprover(leaveNew, getLeaveId());

		}

		return 0;
	}

}