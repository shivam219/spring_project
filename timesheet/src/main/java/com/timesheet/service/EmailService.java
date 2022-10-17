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
					+ "<br>This is an auto-generated Email. Do not reply to this email.<br> In case of any doubts/queries about leave calculations, you can send an email to servicedesk@ess.net.in."
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
			String to = "sandeep.gupta@ess.net.in"; // change service desk email
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

	public void rejectEmailToEmployee(Leave l, String emailId) {
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

	public   void cancelRequestToEmployee(Leave l, String emailId ) {
		try {
			
			String msg = "Hello  " + l.getEmpName() 
					+ "<br>Your Leave Request No : " + l.getLeaveId() + " has been cancelled.<br><br>"
					+ "<b>Leave Details</b> <br> "
					+ "<br>Leave Type: " + l.getLeaveType()
					+ "<br>From Date: " + l.getStartDate() + "<br> To Date: " + l.getEndDate() 
					+ "<br><br>This is an auto-generated Email. Do not reply to this email."
					+ "<br><br\"rohit.sawant@ess.net.in\">Regards,<br>Human Resources";
			Email(emailId,  "Leave Application No: "+ l.getLeaveId()+" Cancelled", msg);

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void cancelRequestToApprover(Leave l,String emailId) {
		try {
			
			String msg = "Hello "+l.getManagerName()
			+ "<br>Leave Request No : " + l.getLeaveId() + " has been cancelled by " +l.getEmpName()
			+ "<br><br><b>Leave Details</b> <br> Leave Type: " + l.getLeaveType()
			+ "<br>From Date: " + l.getStartDate() + "<br> To Date: " + l.getEndDate() 
			+ "<br><br>This is an auto-generated Email. Do not reply to this email."
			+ "<br><br>Regards,<br>Human Resources";		
		Email(emailId, "Leave Application No: " + l.getLeaveId() +" Cancelled", msg);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void Email(String to, String sub, String msg) {
		try {
			String from = "noreply@ess.net.in";
			String pwd = "P@ssw0rd";
			String host = "121.240.21.7";
			// Setup mail server
			Properties properties = new Properties();
			properties.put("mail.smtp.host", host);
			properties.put("mail.smtp.port", "587");
			properties.put("mail.smtp.tls.enable", "true");
			properties.put("mail.smtp.auth", "true");
			Session session2 = Session.getInstance(properties, new Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(from, pwd);
				}
			});
			try {
				MimeMessage message = new MimeMessage(session2);
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
}
