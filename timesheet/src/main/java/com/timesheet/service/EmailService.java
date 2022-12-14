package com.timesheet.service;

import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.stereotype.Service;

import com.timesheet.model.Leave;

@Service
public class EmailService {

	public void leaveSubmitEmailToEmployee(Leave l, String emailId) {
		try {
			String msg = "Hello " + l.getEmpName() + "<br>Your Leave Request No : " + l.getLeaveId()
					+ " submitted successfully.<br><br>" + "<b>Leave Details</b> <br> " + "Leave Type: "
					+ l.getLeaveType() + "<br>From Date: " + l.getStartDate() + "<br> To Date: " + l.getEndDate()
					+ "<br>Reason for Leave: " + l.getLeaveReason()
					+ "<br><br><b>Note</b>: In case of Sick Leaves and or Casual Leaves are over, these leaves will be deducted from Privilege Leaves."
					+ "<br>This is an auto-generated Email. Do not reply to this email.<br> In case of any doubts/queries about leave calculations, you can send an email to servicedesk@ess.net.in"
					+ "<br><br>Regards,<br>Human Resources";
			Email(emailId, "Leave Application No: " + l.getLeaveId() + " Submitted", msg);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void leaveSubmitEmailToApprover(Leave l, String emailId) {
		try {
			String msg = "Hello " + l.getManagerName() + "<br>Your approval is required for Leave Request No : "
					+ l.getLeaveId()
					+ "<br>Please login to Leave Portal on <a href='https://esstools.net.in' target='_blank'> www.esstools.net.in</a> to Approve/Reject this Leave Request.<br><br>"
					+ "<b>Leave Details</b><br> " + "Requester Name: " + l.getEmpName() + " <br> Leave Type: "
					+ l.getLeaveType() + "<br>From Date: " + l.getStartDate() + "<br> To Date: " + l.getEndDate()
					+ "<br>Reason for Leave: " + l.getLeaveReason()
					+ "<br><br>This is an auto-generated Email. Do not reply to this email."
					+ "<br><br>Regards,<br>Human Resources";
			Email(emailId, "Approval for Leave Application No: " + l.getLeaveId(), msg);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void LeaveApproveToServicedesk(Leave l) {
		try {
			String to = "shivam.choudhary@ess.net.in"; // change service desk email
			String msg = "Hello ServiceDesk" + "<br> Leave Request No : " + l.getLeaveId() + " has been approved.<br>"
					+ "<br><b>Leave Details</b><br> " + "Requester Name: " + l.getEmpName() + "<br>Leave Type: "
					+ l.getLeaveType() + "<br>From Date: " + l.getStartDate() + "<br> To Date: " + l.getEndDate()
					+ "<br>Reason for Leave: " + l.getLeaveReason()
					+ "<br><br><b>Request you to update necessary details in ERP Portal.</b>"
					+ "<br><br>This is an auto-generated Email. Do not reply to this email."
					+ "<br><br>Regards,<br>Human Resources";
			Email(to, "Leave Application No: " + l.getLeaveId() + " Approved", msg);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void LeaveApproveToEmployee(Leave l, String emailId) {
		try {

			String msg = "Hello  " + l.getEmpName() + "<br>Your Leave Request No : " + l.getLeaveId()
					+ " has been approved.<br><br>" + "<b>Leave Details</b> <br>Requester Name: " + l.getEmpName()
					+ "<br>Leave Type: " + l.getLeaveType() + "<br>From Date: " + l.getStartDate() + "<br> To Date: "
					+ l.getEndDate() + "<br>Reason for Leave: " + l.getLeaveReason() + "<br>Additional comments: "
					+ (l.getApproveReason() == null ? "" : l.getApproveReason())
					+ "<br><br>This is an auto-generated Email. Do not reply to this email."
					+ "<br><br>Regards,<br>Human Resources";
			Email(emailId, "Leave Application No: " + l.getLeaveId() + " Approved", msg);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void LeaveApproveToSecondManager(Leave u, String emailId, String approvalManagerName) {
		try {
			String msg = "Hello " + approvalManagerName + "<br>Your approval is required for Leave Request No : "
					+ u.getLeaveId()
					+ "<br>Please login to Leave Portal on <a href='https://esstools.net.in' target='_blank'> www.esstools.net.in</a> to Approve/Reject this Leave Request.<br><br>"
					+ "<b>Leave Details</b><br> " + "Requester Name: " + u.getEmpName() + "<br> Day Status: "
					+ u.getDayMode() + " <br> Leave Type: " + u.getLeaveType() + "<br>From Date: " + u.getStartDate()
					+ "<br> To Date: " + u.getEndDate() + "<br>Reason for Leave: " + u.getLeaveReason()
					+ "<br> Initially Approved By: " + u.getManagerName()
					+ "<br><br>This is an auto-generated Email. Do not reply to this email."
					+ "<br><br>Regards,<br>Human Resources";
			Email(emailId, "Leave Application No: " + u.getLeaveId() + " Approved", msg);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void leaveRejectEmailToEmployee(Leave l, String emailId) {
		try {

			String msg = "Hello " + l.getEmpName() + "<br>Your Leave Request No : " + l.getLeaveId()
					+ " has been rejected.<br>" + "<br><b>Leave Details </b><br> " + " Leave Type: " + l.getLeaveType()
					+ "<br>From Date: " + l.getStartDate() + "<br> To Date: " + l.getEndDate()
					+ "<br>Reason for Leave: " + l.getLeaveReason() + "<br>Reason for Rejection: " + l.getRejectReason()
					+ "<br><br>This is an auto-generated Email. Do not reply to this email."
					+ "<br><br>Regards,<br>Human Resources";
			Email(emailId, "Leave No: " + l.getLeaveId() + " Rejected", msg);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void leaveCancelRequestToEmployee(Leave l, String emailId) {
		try {
			String msg = "Hello  " + l.getEmpName() + "<br>Your Leave Request No : " + l.getLeaveId()
					+ " has been cancelled.<br><br>" + "<b>Leave Details</b> <br> " + "<br>Leave Type: "
					+ l.getLeaveType() + "<br>From Date: " + l.getStartDate() + "<br> To Date: " + l.getEndDate()
					+ "<br><br>This is an auto-generated Email. Do not reply to this email."
					+ "<br><br\"rohit.sawant@ess.net.in\">Regards,<br>Human Resources";
			Email(emailId, "Leave Application No: " + l.getLeaveId() + " Cancelled", msg);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void leaveCancelRequestToApprover(Leave l, String emailId, String managerName) {
		try {
			String msg = "Hello " + managerName + "<br>Leave Request No : " + l.getLeaveId() + " has been cancelled by "
					+ l.getEmpName() + "<br><br><b>Leave Details</b> <br> Leave Type: " + l.getLeaveType()
					+ "<br>From Date: " + l.getStartDate() + "<br> To Date: " + l.getEndDate()
					+ "<br><br>This is an auto-generated Email. Do not reply to this email."
					+ "<br><br>Regards,<br>Human Resources";
			Email(emailId, "Leave Application No: " + l.getLeaveId() + " Cancelled", msg);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void leaveCancelRequestToServiceDesk(Leave l, String emailId) {
		try {
			String msg = "Hello Service Desk " + "<br>Leave Request No : " + l.getLeaveId() + " has been cancelled by "
					+ l.getEmpName() + "<br><br><b>Leave Details</b> <br> Leave Type: " + l.getLeaveType()
					+ "<br>From Date: " + l.getStartDate() + "<br> To Date: " + l.getEndDate()
					+ "<br><br>This is an auto-generated Email. Do not reply to this email."
					+ "<br><br>Regards,<br>Human Resources";
			Email(emailId, "Leave Application No: " + l.getLeaveId() + " Cancelled", msg);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void leaveRejectEmailToManager(Leave l, String emailId, String rejectBy) {
		try {
			String msg = "";
			msg = "Hello " + rejectBy + "<br> Leave request No : " + l.getLeaveId() + " has been rejected."
					+ "<br><br><b>Leave Details </b><br> " + "Requester Name: " + l.getEmpName() + "<br> Day Status: "
					+ l.getDayMode() + "<br> Leave Type: " + l.getLeaveType() + "<br>From Date: " + l.getStartDate()
					+ "<br> To Date: " + l.getEndDate() + "<br>Reason for Leave: " + l.getLeaveReason()
					+ "<br>Rejected by: " + rejectBy + "<br>Reason for Rejection: " + l.getRejectReason()
					+ "<br><br>This is an auto-generated Email. Do not reply to this email."
					+ "<br><br>Regards,<br>Human Resources";

			Email(emailId, "Leave Application No: " + l.getLeaveId() + " Rejected", msg);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void leaveRejectEmailToLastManager(Leave l, String emailId, String rejectBy) {
		try {
			String msg = "";
			msg = "Hello " + rejectBy + "<br> Leave request No : " + l.getLeaveId() + " has been rejected."
					+ "<br><br><b>Leave Details </b><br> " + "Requester Name: " + l.getEmpName() + "<br> Day Status: "
					+ l.getDayMode() + "<br> Leave Type: " + l.getLeaveType() + "<br>From Date: " + l.getStartDate()
					+ "<br> To Date: " + l.getEndDate() + "<br>Reason for Leave: " + l.getLeaveReason()
					+ "<br>Rejected by: " + rejectBy + "<br>Reason for Rejection: " + l.getRejectReason()
					+ "<br><br>This is an auto-generated Email. Do not reply to this email."
					+ "<br><br>Regards,<br>Human Resources";

			Email(emailId, "Leave Application No: " + l.getLeaveId() + " Rejected", msg);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void leeaveRejectEmailToEmployee(Leave l, String emailId, String managerName, String rejectedBy) {
		try {
			String msg = "";
			msg = "Hello " + managerName + "<br> Leave request No : " + l.getLeaveId() + " has been rejected."
					+ "<br><br><b>Leave Details </b><br> " + "Requester Name: " + l.getEmpName() + "<br> Day Status: "
					+ l.getDayMode() + "<br> Leave Type: " + l.getLeaveType() + "<br>From Date: " + l.getStartDate()
					+ "<br> To Date: " + l.getEndDate() + "<br>Reason for Leave: " + l.getLeaveReason()
					+ "<br>Rejected by: " + rejectedBy + "<br>Reason for Rejection: " + l.getRejectReason()
					+ "<br><br>This is an auto-generated Email. Do not reply to this email."
					+ "<br><br>Regards,<br>Human Resources";

			Email(emailId, "Leave Application No: " + l.getLeaveId() + " Rejected", msg);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void Email(String to, String sub, String msg) {
		try {
			String from = "shivam.choudhary@ess.net.in";
			String pwd = "Zipmail@219";
//			String from = "noreply@ess.net.in";
//			String pwd = "Zipmail#22";
			String host = "121.240.21.7";
			Properties pro = new Properties();
			pro.put("mail.smtp.host", host);
			pro.put("mail.smtp.port", "587");
			pro.put("mail.smtp.tls.enable", "true");
			pro.put("mail.smtp.auth", "true");
//			pro.put("mail.debug", "true");
//			pro.put("mail.smtp.ssl.enable", "true"); // need to change smtp port
//			pro.put("mail.smtp.port", "465");
//			pro.put("mail.smtp.auth", "false");
			Session ss = Session.getInstance(pro, new Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(from, pwd);
				}
			});
			try {
				MimeMessage message = new MimeMessage(ss);
				message.setFrom(new InternetAddress(from));
				message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
				message.setSubject(sub);
				message.setContent(msg, "text/html");
				Transport.send(message);
			} catch (MessagingException ex) {
				ex.printStackTrace();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void sendEmail(String to, String msg, String subject) throws Exception {
		String from = "noreply@ess.net.in";
		String pwd = "P@ssw0rd";
		String host = "121.240.21.7";
		Properties pro = new Properties();
		pro.put("mail.smtp.host", host);
		pro.put("mail.smtp.port", "587");
		pro.put("mail.smtp.tls.enable", "true");
		pro.put("mail.smtp.auth", "true");

		Session ss = Session.getInstance(pro, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(from, pwd);
			}
		});
		MimeMessage m = new MimeMessage(ss);
		m.setFrom(new InternetAddress(from));
		m.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
		m.setSubject(subject);
		m.setContent(msg, "text/html");
		Transport.send(m);
	}

}
