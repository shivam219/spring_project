package com.timesheet.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.timesheet.model.Leave;
import com.timesheet.repository.ApproveRepository;

@Service
public class ApproveService {

	@Autowired
	public ApproveRepository approveRepository;

	@Autowired
	public EmailService emailService;

	public List<Leave> isValidApprove(Leave le) {
		List<Leave> lea = null;
		try {
			lea = approveRepository.isValidApprove(le.getManagerId(), le.getStatus());
		} catch (Exception e) {
			e.printStackTrace();
		}
		return lea;
	}

	public List<Leave> getAllLeave() {
		return (List<Leave>) approveRepository.findAll();
	}

	public List<Leave> leaveList(String managerId, String status) {
		return approveRepository.findByManagerIdAndStatus(managerId, status);
	}

	public int updateApproveStatus(Leave leaveOld) {

		if (approveRepository.updateApproveStatus(leaveOld.getLeaveId(), leaveOld.getApproveReason()) == 1) {
			Long lc = Long.valueOf(leaveOld.getLeaveId().substring(1));
			System.out.println(lc);
			Optional<Leave> l2 = approveRepository.findById(lc);
			Leave leaveNew = l2.get();
			leaveNew.setApproveReason(leaveOld.getApproveReason());
			emailService.LeaveApproveToEmployee(leaveNew, "sandeep.gupta@ess.net.in");
			emailService.LeaveApproveToServicedesk(leaveNew);
		}
		return 0;
	}

	public int updateRejectStatus(Leave leaveOld) {
		if (approveRepository.updateRejectStatus(leaveOld.getLeaveId(), leaveOld.getRejectReason()) == 1) {
			Long lc = Long.valueOf(leaveOld.getLeaveId().substring(1));
			System.out.println(lc);
			Optional<Leave> l2 = approveRepository.findById(lc);
			Leave leaveNew = l2.get();
			leaveNew.setRejectReason(leaveOld.getRejectReason());

			emailService.rejectEmailToEmployee(leaveNew, "sandeep.gupta@ess.net.in");
		}

		return 0;
	}
}
