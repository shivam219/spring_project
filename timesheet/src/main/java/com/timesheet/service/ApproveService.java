
package com.timesheet.service;

import java.util.List;
import java.util.Optional;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

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

	public int updateRejectStatus(Leave l, long empId, String lastManager) {
		if (approveRepository.updateRejectStatus(l.getLeaveId(), l.getRejectReason()) == 1) {
			es.leaveRejectEmailToEmployee(l, er.findEmpEmailByEmpId(l.getEmpId()));
			if (l.getManagerId() == empId) {
				ExecutorService executor = Executors.newWorkStealingPool();
				executor.execute(() -> {
					es.leaveRejectEmailToManager(l, er.findEmpEmailByEmpId(l.getManagerId()), l.getManagerName());
				});
			} else if (l.getLeaveManagerId() == empId) {
				ExecutorService executor = Executors.newWorkStealingPool();
				executor.execute(() -> {
					es.leaveRejectEmailToManager(l, er.findEmpEmailByEmpId(l.getManagerId()), l.getManagerName());
					es.leaveRejectEmailToLastManager(l, er.findEmpEmailByEmpId(l.getLeaveManagerId()), lastManager);
				});
			}
			return 1;
		}
		return 0;
	}

}