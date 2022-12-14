package com.timesheet.dto;

public class LeaveStatusDto {

	String month;
	String approve;
	String reject;
	String cancel;
	String pending;

	public LeaveStatusDto() {
		super();
	}

	public LeaveStatusDto(String month, String approve, String reject, String cancel, String pending) {
		super();
		this.month = month;
		this.approve = approve;
		this.reject = reject;
		this.cancel = cancel;
		this.pending = pending;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public String getApprove() {
		return approve;
	}

	public void setApprove(String approve) {
		this.approve = approve;
	}

	public String getReject() {
		return reject;
	}

	public void setReject(String reject) {
		this.reject = reject;
	}

	public String getCancel() {
		return cancel;
	}

	public void setCancel(String cancel) {
		this.cancel = cancel;
	}

	public String getPending() {
		return pending;
	}

	public void setPending(String pending) {
		this.pending = pending;
	}

	@Override
	public String toString() {
		return "LeaveStatusDto [month=" + month + ", approve=" + approve + ", reject=" + reject + ", cancel=" + cancel
				+ ", pending=" + pending + "]";
	}

}
