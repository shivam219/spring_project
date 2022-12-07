
package com.timesheet.service;

import java.util.List;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.timesheet.model.Leave;
import com.timesheet.repository.ApproveRepository;
import com.timesheet.repository.EmployeeRepository;

@Service
public class ApproveService {

	@Autowired
	public ApproveRepository approveRepository;

	@Autowired
	public EmailService es;

	@Autowired
	public EmployeeRepository er;

	public List<Leave> getAllLeave() {
		return (List<Leave>) approveRepository.findAll();
	}

	public List<Leave> leaveList(String managerId, String status) {
		return approveRepository.findByManagerIdAndStatus(managerId, status);
	}

	public List<Leave> leaveList1(String leaveManagerId, String secondStatus) {
		return approveRepository.findByManagerIdAndStatus(leaveManagerId, secondStatus);
	}

	public int updateRejectStatus(Leave l, long empId,String lastManager) {
//		String empName = (String) request.getSession().getAttribute("empName");
		if (approveRepository.updateRejectStatus(l.getLeaveId(), l.getRejectReason()) == 1) {
//			Long lc = Long.valueOf(leave.getLeaveId().substring(1));
//			Optional<Leave> l2 = approveRepository.findById(lc);
//			Leave leaveNew = l2.get();
//			leaveNew.setRejectReason(leave.getRejectReason());

			es.leaveRejectEmailToEmployee(l, er.findEmpEmailByEmpId(l.getEmpId()));
			if (l.getManagerId() == empId) {
				es.leaveRejectEmailToManager(l, er.findEmpEmailByEmpId(l.getManagerId()), l.getManagerName());
			} else if (l.getLeaveManagerId() == empId) {
				es.leaveRejectEmailToManager(l, er.findEmpEmailByEmpId(l.getManagerId()), l.getManagerName());
				es.leaveRejectEmailToLastManager(l, er.findEmpEmailByEmpId(l.getLeaveManagerId()), lastManager);
			}
			return 1;
		}
		return 0;
	}

}