package com.timesheet.service;

import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.timesheet.model.Project;
import com.timesheet.model.Work;
import com.timesheet.model.WorkMaster;
import com.timesheet.repository.ProjectRepository;
import com.timesheet.repository.WorkMasterRepository;
import com.timesheet.repository.WorkRepository;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.time.Month;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.mail.util.ByteArrayDataSource;

@Component
public class WorkService {

	@Autowired
	WorkRepository repository;
	@Autowired
	ProjectRepository prepository;

	@Autowired
	WorkMasterRepository wmrepository;

	public boolean saveAllWork(List<Work> work) {
		boolean isSave = false;
		try {
			List<Work> list = (List<Work>) repository.saveAll(work);
			isSave = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return isSave;
	}

	public boolean deleteAllWork(List<Work> work) {
		boolean isDelete = false;
		try {
			repository.deleteAll(work);
			isDelete = true;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return isDelete;
	}
	// @formatter:off
 

	public LinkedHashMap<String, List<Work>> getWorByStartDateEndDate(String startDate, String endDate, long empId) {
		List<Work> l = repository.getWorByStartDateEndDate(startDate, endDate, empId);
		List<Project> plist = (List<Project>) prepository.getProjectByEmpId(empId);
		Collections.sort(l, (e1, e2) -> e1.getDay().compareTo(e2.getDay()));

		LinkedHashMap<String, List<Work>> map = new LinkedHashMap<String, List<Work>>();
		for (Work w : l) {
			if (map.containsKey(w.getProjectName())) {
				LocalDate t = LocalDate.parse(w.getDay(), DateTimeFormatter.ofPattern("yyyy-MM-dd"));
				Work wl = map.get(w.getProjectName()).get(map.get(w.getProjectName()).size() - 1);// give last object
																									// like tue
				LocalDate d1 = LocalDate.parse(wl.getDay(), DateTimeFormatter.ofPattern("yyyy-MM-dd"));
				LocalDate d2 = LocalDate.parse(w.getDay(), DateTimeFormatter.ofPattern("yyyy-MM-dd"));
				int df = (int) (Period.between(d1, d2).getDays() - 1); // 22

				ArrayList<Work> al = new ArrayList<Work>();
				al.addAll(map.get(w.getProjectName()));
				for (int i = df; i > 0; i--) {
					Work w2 = new Work();
					w2.setId(0);
					w2.setEmpId(w.getEmpId());
					w2.setProjectId(w.getProjectId());
					w2.setProjectName(w.getProjectName());
					w2.setDay(t.minusDays(i).toString());
					w2.setHours("0");
					w2.setDescr("");
					 
					al.add(w2);
				}
				al.add(w);
				map.put(w.getProjectName(), al);

			} else {
				LocalDate t = LocalDate.parse(w.getDay(), DateTimeFormatter.ofPattern("yyyy-MM-dd"));
				if (t.getDayOfWeek().toString().equals("MONDAY")) {
					ArrayList<Work> al = new ArrayList<Work>();
					al.add(w);
					map.put(w.getProjectName(), al);
				} else if (t.getDayOfWeek().toString().equals("TUESDAY")) {
					Work w2 = new Work();
					w2.setId(0);
					w2.setEmpId(w.getEmpId());
					w2.setProjectId(w.getProjectId());
					w2.setProjectName(w.getProjectName());
					w2.setDay(t.minusDays(1).toString());
					w2.setHours("0");
					w2.setDescr("");
					 
					ArrayList<Work> al = new ArrayList<Work>();
					al.add(w2);
					al.add(w);
					map.put(w.getProjectName(), al);

				} else if (t.getDayOfWeek().toString().equals("WEDNESDAY")) {
					ArrayList<Work> al = new ArrayList<Work>();
					for (int i = 2; i > 0; i--) {
						Work w2 = new Work();
						w2.setId(0);
						w2.setEmpId(w.getEmpId());
						w2.setProjectId(w.getProjectId());
						w2.setProjectName(w.getProjectName());
						w2.setDay(t.minusDays(i).toString());
						w2.setHours("0");
						w2.setDescr("");
						 
						al.add(w2);
					}
					al.add(w);
					map.put(w.getProjectName(), al);
				} else if (t.getDayOfWeek().toString().equals("THURSDAY")) {
					ArrayList<Work> al = new ArrayList<Work>();
					for (int i = 3; i > 0; i--) {
						Work w2 = new Work();
						w2.setId(0);
						w2.setEmpId(w.getEmpId());
						w2.setProjectId(w.getProjectId());
						w2.setProjectName(w.getProjectName());
						w2.setDay(t.minusDays(i).toString());
						w2.setHours("0");
						w2.setDescr("");
						al.add(w2);
					}
					al.add(w);
					map.put(w.getProjectName(), al);
				} else if (t.getDayOfWeek().toString().equals("FRIDAY")) {
					ArrayList<Work> al = new ArrayList<Work>();
					for (int i = 4; i > 0; i--) {
						Work w2 = new Work();
						w2.setId(0);
						w2.setEmpId(w.getEmpId());
						w2.setProjectId(w.getProjectId());
						w2.setProjectName(w.getProjectName());
						w2.setDay(t.minusDays(i).toString());
						w2.setHours("0");
						w2.setDescr("");
						al.add(w2);
					}
					al.add(w);
					map.put(w.getProjectName(), al);
				} else if (t.getDayOfWeek().toString().equals("SATDAY")) {
					ArrayList<Work> al = new ArrayList<Work>();
					for (int i = 5; i > 0; i--) {
						Work w2 = new Work();
						w2.setId(0);
						w2.setEmpId(w.getEmpId());
						w2.setProjectId(w.getProjectId());
						w2.setProjectName(w.getProjectName());
						w2.setDay(t.minusDays(i).toString());
						w2.setHours("0");
						w2.setDescr("");
						 
						al.add(w2);
					}
					al.add(w);
					map.put(w.getProjectName(), al);
				} else if (t.getDayOfWeek().toString().equals("SUNDAY")) {
					ArrayList<Work> al = new ArrayList<Work>();
					for (int i = 6; i > 0; i--) {
						Work w2 = new Work();
						w2.setId(0);
						w2.setEmpId(w.getEmpId());
						w2.setProjectId(w.getProjectId());
						w2.setProjectName(w.getProjectName());
						w2.setDay(t.minusDays(i).toString());
						w2.setHours("0");
						w2.setDescr("");
						 
						al.add(w2);
					}
					al.add(w);
					map.put(w.getProjectName(), al);
				}

			}

		}
		for (Map.Entry<String, List<Work>> entry : map.entrySet()) {
			String key = entry.getKey();
			int len = entry.getValue().size(); // 7 - 4 = 3
			Work wl = entry.getValue().get(entry.getValue().size() - 1); // give last object
			LocalDate d1 = LocalDate.parse(wl.getDay(), DateTimeFormatter.ofPattern("yyyy-MM-dd")); /// 25
			ArrayList<Work> al = new ArrayList<Work>();
			al.addAll(entry.getValue());
			for (int i = 1; i <= (7 - len); i++) {
				Work w2 = new Work();
				w2.setId(0);
				w2.setEmpId(wl.getEmpId());
				w2.setProjectId(wl.getProjectId());
				w2.setProjectName(wl.getProjectName());
				w2.setDay(d1.plusDays(i).toString());
				w2.setHours("0");
				w2.setDescr("");
				 
				al.add(w2);
			}
			map.put(key, al);
		}
		for (Project p : plist) {
			if (map.containsKey(p.getProjectName())) {
				
			} else {
				LocalDate  sd= LocalDate.parse(startDate , DateTimeFormatter.ofPattern("yyyy-MM-dd"));
				ArrayList<Work> al = new ArrayList<Work>();
				for (int i = 0; i < 7; i++) {
					Work w2 = new Work();
					w2.setId(0);
					w2.setEmpId(empId);
					w2.setProjectId(p.getProjectId());
					w2.setProjectName(p.getProjectName());
					w2.setDay(sd.plusDays(i).toString());
					w2.setHours("0");
					w2.setDescr("");
					 
					al.add(w2);
				}
				map.put(p.getProjectName(), al);

			}
		}
		for (Map.Entry<String, List<Work>> entry : map.entrySet()) {
			String key = entry.getKey();
			List<Work> val = entry.getValue();
		}

		return map;
	}
	
	
	public LinkedHashMap<String, List<Work>> getSubmittedWork(String startDate, String endDate, long empId) {
		List<Work> l = repository.getWorByStartDateEndDate(startDate, endDate, empId);
		List<Project> plist = (List<Project>) prepository.getProjectByEmpId(empId);
		Collections.sort(l, (e1, e2) -> e1.getDay().compareTo(e2.getDay()));

		LinkedHashMap<String, List<Work>> map = new LinkedHashMap<String, List<Work>>();
		for (Work w : l) {
			if (map.containsKey(w.getProjectName())) {
				LocalDate t = LocalDate.parse(w.getDay(), DateTimeFormatter.ofPattern("yyyy-MM-dd"));
				Work wl = map.get(w.getProjectName()).get(map.get(w.getProjectName()).size() - 1);// give last object
																									// like tue
				LocalDate d1 = LocalDate.parse(wl.getDay(), DateTimeFormatter.ofPattern("yyyy-MM-dd"));
				LocalDate d2 = LocalDate.parse(w.getDay(), DateTimeFormatter.ofPattern("yyyy-MM-dd"));
				int df = (int) (Period.between(d1, d2).getDays() - 1); // 22

				ArrayList<Work> al = new ArrayList<Work>();
				al.addAll(map.get(w.getProjectName()));
				for (int i = df; i > 0; i--) {
					Work w2 = new Work();
					w2.setId(0);
					w2.setEmpId(w.getEmpId());
					w2.setProjectId(w.getProjectId());
					w2.setProjectName(w.getProjectName());
					w2.setDay(t.minusDays(i).toString());
					w2.setHours("0");
					w2.setDescr("");
					 
					al.add(w2);
				}
				al.add(w);
				map.put(w.getProjectName(), al);

			} else {
				LocalDate t = LocalDate.parse(w.getDay(), DateTimeFormatter.ofPattern("yyyy-MM-dd"));
				if (t.getDayOfWeek().toString().equals("MONDAY")) {
					ArrayList<Work> al = new ArrayList<Work>();
					al.add(w);
					map.put(w.getProjectName(), al);
				} else if (t.getDayOfWeek().toString().equals("TUESDAY")) {
					Work w2 = new Work();
					w2.setId(0);
					w2.setEmpId(w.getEmpId());
					w2.setProjectId(w.getProjectId());
					w2.setProjectName(w.getProjectName());
					w2.setDay(t.minusDays(1).toString());
					w2.setHours("0");
					w2.setDescr("");
					 
					ArrayList<Work> al = new ArrayList<Work>();
					al.add(w2);
					al.add(w);
					map.put(w.getProjectName(), al);

				} else if (t.getDayOfWeek().toString().equals("WEDNESDAY")) {
					ArrayList<Work> al = new ArrayList<Work>();
					for (int i = 2; i > 0; i--) {
						Work w2 = new Work();
						w2.setId(0);
						w2.setEmpId(w.getEmpId());
						w2.setProjectId(w.getProjectId());
						w2.setProjectName(w.getProjectName());
						w2.setDay(t.minusDays(i).toString());
						w2.setHours("0");
						w2.setDescr("");
						 
						al.add(w2);
					}
					al.add(w);
					map.put(w.getProjectName(), al);
				} else if (t.getDayOfWeek().toString().equals("THURSDAY")) {
					ArrayList<Work> al = new ArrayList<Work>();
					for (int i = 3; i > 0; i--) {
						Work w2 = new Work();
						w2.setId(0);
						w2.setEmpId(w.getEmpId());
						w2.setProjectId(w.getProjectId());
						w2.setProjectName(w.getProjectName());
						w2.setDay(t.minusDays(i).toString());
						w2.setHours("0");
						w2.setDescr("");
						al.add(w2);
					}
					al.add(w);
					map.put(w.getProjectName(), al);
				} else if (t.getDayOfWeek().toString().equals("FRIDAY")) {
					ArrayList<Work> al = new ArrayList<Work>();
					for (int i = 4; i > 0; i--) {
						Work w2 = new Work();
						w2.setId(0);
						w2.setEmpId(w.getEmpId());
						w2.setProjectId(w.getProjectId());
						w2.setProjectName(w.getProjectName());
						w2.setDay(t.minusDays(i).toString());
						w2.setHours("0");
						w2.setDescr("");
						al.add(w2);
					}
					al.add(w);
					map.put(w.getProjectName(), al);
				} else if (t.getDayOfWeek().toString().equals("SATDAY")) {
					ArrayList<Work> al = new ArrayList<Work>();
					for (int i = 5; i > 0; i--) {
						Work w2 = new Work();
						w2.setId(0);
						w2.setEmpId(w.getEmpId());
						w2.setProjectId(w.getProjectId());
						w2.setProjectName(w.getProjectName());
						w2.setDay(t.minusDays(i).toString());
						w2.setHours("0");
						w2.setDescr("");
						 
						al.add(w2);
					}
					al.add(w);
					map.put(w.getProjectName(), al);
				} else if (t.getDayOfWeek().toString().equals("SUNDAY")) {
					ArrayList<Work> al = new ArrayList<Work>();
					for (int i = 6; i > 0; i--) {
						Work w2 = new Work();
						w2.setId(0);
						w2.setEmpId(w.getEmpId());
						w2.setProjectId(w.getProjectId());
						w2.setProjectName(w.getProjectName());
						w2.setDay(t.minusDays(i).toString());
						w2.setHours("0");
						w2.setDescr("");
						 
						al.add(w2);
					}
					al.add(w);
					map.put(w.getProjectName(), al);
				}

			}

		}
		for (Map.Entry<String, List<Work>> entry : map.entrySet()) {
			String key = entry.getKey();
			int len = entry.getValue().size();  
			Work wl = entry.getValue().get(entry.getValue().size() - 1);  
			LocalDate d1 = LocalDate.parse(wl.getDay(), DateTimeFormatter.ofPattern("yyyy-MM-dd")); 
			ArrayList<Work> al = new ArrayList<Work>();
			al.addAll(entry.getValue());
			for (int i = 1; i <= (7 - len); i++) {
				Work w2 = new Work();
				w2.setId(0);
				w2.setEmpId(wl.getEmpId());
				w2.setProjectId(wl.getProjectId());
				w2.setProjectName(wl.getProjectName());
				w2.setDay(d1.plusDays(i).toString());
				w2.setHours("0");
				w2.setDescr("");
				 
				al.add(w2);
			}
			map.put(key, al);
		}
		for (Project p : plist) {
			if (map.containsKey(p.getProjectName())) {
				
			} else {
				LocalDate  sd= LocalDate.parse(startDate , DateTimeFormatter.ofPattern("yyyy-MM-dd"));
				ArrayList<Work> al = new ArrayList<Work>();
				for (int i = 0; i < 7; i++) {
					Work w2 = new Work();
					w2.setId(0);
					w2.setEmpId(empId);
					w2.setProjectId(p.getProjectId());
					w2.setProjectName(p.getProjectName());
					w2.setDay(sd.plusDays(i).toString());
					w2.setHours("0");
					w2.setDescr("");
					 
					al.add(w2);
				}
				map.put(p.getProjectName(), al);

			}
		}
		for (Map.Entry<String, List<Work>> entry : map.entrySet()) {
			String key = entry.getKey();
			List<Work> val = entry.getValue();
			boolean flag = true;
			for(Work w : val) {
				if(!w.getHours().equals("0")) {
					flag= false;
				}
			}
			if(flag) {
				map.remove(key);
			}
		}
		return map;
	}
	
	
	public void submitWork(WorkMaster wm) {
		wmrepository.save(wm);
		String msg = "Hii " 
		+ "<br>Employee No  : " + wm.getEmpId()
		+ " has submitted work report.<br><br>" 
		+ "<b>Work Report</b> <br> "
		+ "<br>From Date: " + wm.getStartDate()
		+ "<br> To Date: " + wm.getEndDate() 
		+ "<br><br><b>Note</b>: "
		+ "<br><br>Regards,<br>Human Resources";
		sendEmail("shivam.choudhary@ess.net.in", msg, "work report submited");
	}
	// @formatter:on

	public WorkMaster getWorkMaster(WorkMaster wm) {
		return wmrepository.getWorkMaster(wm.getEmpId(), wm.getStartDate(), wm.getEndDate());
	}

	public int updateStatusApproved(WorkMaster wm) {
		return wmrepository.updateStatusApproved(wm.getEmpId(), wm.getStartDate(), wm.getEndDate());
	}

	public int updateStatusRejected(WorkMaster wm) {
		return wmrepository.updateStatusRejected(wm.getEmpId(), wm.getStartDate(), wm.getEndDate());
	}

	public void sendEmail(String to, String msg, String subject) {

		String from = "noreply@ess.net.in";
		String pwd = "P@ssw0rd";
		String host = "121.240.21.7";
		Properties properties = new Properties();
		properties.put("mail.smtp.host", host);
		properties.put("mail.smtp.port", "587");
		properties.put("mail.smtp.tls.enable", "true");
		properties.put("mail.smtp.auth", "true");

		Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(from, pwd);
			}
		});

		try {
			MimeMessage m = new MimeMessage(session);
			m.setFrom(new InternetAddress(from));
			m.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
			m.setSubject(subject);
			m.setContent(msg, "text/html");
			Transport.send(m);
		} catch (MessagingException mex) {
			mex.printStackTrace();
		}
	}

}
