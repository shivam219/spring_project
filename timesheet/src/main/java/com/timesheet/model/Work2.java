package com.timesheet.model;

import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "ess_work2")
public class Work2 {

	/* 
	 * indenity , auto will generate automatic increase by one from same table last
	 * entry
	 *
	 * sequence will take auto increment value from hibernate sequence table
	 * 
	 * Table - Table 'spring.hibernate_sequences' doesn't exist
	 * 
	 * @@EmbeddedId - give error
	 * 
	 * --error - solve - delete table ava.sql.SQLException: Field 'work_id' doesn't
	 * have a
	 */

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	private int id;

	@Column(name = "emp_id")
	private long empId;

	@Column(name = "project_id")
	private int projectId;
	
	@Column(name = "project_name")
	private String projectName;

	@Column(name = "wdate")
	private String wDate;

	@Column(name = "mon")
	private String mon;
	@Column(name = "mon_des")
	private String monDes;

	@Column(name = "tue")
	private String tue;
	@Column(name = "tue_des")
	private String tueDes;

	@Column(name = "wed")
	private String wed;
	@Column(name = "wed_des")
	private String wedDes;

	@Column(name = "thu")
	private String thu;
	@Column(name = "thu_des")
	private String thuDes;

	@Column(name = "fri")
	private String fri;
	@Column(name = "fri_des")
	private String friDes;

	@Column(name = "sat")
	private String sat;
	@Column(name = "sat_des")
	private String satDes;

	@Column(name = "sun")
	private String sun;
	@Column(name = "sun_des")
	private String sunDes;

	@Column(name = "status")
	private String status;

	public Work2() {
		super();
	}

	public Work2(int id, long empId, int projectId, String projectName, String wDate, String mon, String monDes,
			String tue, String tueDes, String wed, String wedDes, String thu, String thuDes, String fri, String friDes,
			String sat, String satDes, String sun, String sunDes, String status) {
		super();
		this.id = id;
		this.empId = empId;
		this.projectId = projectId;
		this.projectName = projectName;
		this.wDate = wDate;
		this.mon = mon;
		this.monDes = monDes;
		this.tue = tue;
		this.tueDes = tueDes;
		this.wed = wed;
		this.wedDes = wedDes;
		this.thu = thu;
		this.thuDes = thuDes;
		this.fri = fri;
		this.friDes = friDes;
		this.sat = sat;
		this.satDes = satDes;
		this.sun = sun;
		this.sunDes = sunDes;
		this.status = status;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public long getEmpId() {
		return empId;
	}

	public void setEmpId(long empId) {
		this.empId = empId;
	}

	public int getProjectId() {
		return projectId;
	}

	public void setProjectId(int projectId) {
		this.projectId = projectId;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public String getwDate() {
		return wDate;
	}

	public void setwDate(String wDate) {
		this.wDate = wDate;
	}

	public String getMon() {
		return mon;
	}

	public void setMon(String mon) {
		this.mon = mon;
	}

	public String getMonDes() {
		return monDes;
	}

	public void setMonDes(String monDes) {
		this.monDes = monDes;
	}

	public String getTue() {
		return tue;
	}

	public void setTue(String tue) {
		this.tue = tue;
	}

	public String getTueDes() {
		return tueDes;
	}

	public void setTueDes(String tueDes) {
		this.tueDes = tueDes;
	}

	public String getWed() {
		return wed;
	}

	public void setWed(String wed) {
		this.wed = wed;
	}

	public String getWedDes() {
		return wedDes;
	}

	public void setWedDes(String wedDes) {
		this.wedDes = wedDes;
	}

	public String getThu() {
		return thu;
	}

	public void setThu(String thu) {
		this.thu = thu;
	}

	public String getThuDes() {
		return thuDes;
	}

	public void setThuDes(String thuDes) {
		this.thuDes = thuDes;
	}

	public String getFri() {
		return fri;
	}

	public void setFri(String fri) {
		this.fri = fri;
	}

	public String getFriDes() {
		return friDes;
	}

	public void setFriDes(String friDes) {
		this.friDes = friDes;
	}

	public String getSat() {
		return sat;
	}

	public void setSat(String sat) {
		this.sat = sat;
	}

	public String getSatDes() {
		return satDes;
	}

	public void setSatDes(String satDes) {
		this.satDes = satDes;
	}

	public String getSun() {
		return sun;
	}

	public void setSun(String sun) {
		this.sun = sun;
	}

	public String getSunDes() {
		return sunDes;
	}

	public void setSunDes(String sunDes) {
		this.sunDes = sunDes;
	}

	
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	

	@Override
	public int hashCode() {
		return Objects.hash(empId, fri, friDes, id, mon, monDes, projectId, projectName, sat, satDes, status, sun,
				sunDes, thu, thuDes, tue, tueDes, wDate, wed, wedDes);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Work2 other = (Work2) obj;
		return empId == other.empId && Objects.equals(fri, other.fri) && Objects.equals(friDes, other.friDes)
				&& id == other.id && Objects.equals(mon, other.mon) && Objects.equals(monDes, other.monDes)
				&& projectId == other.projectId && projectName == other.projectName && Objects.equals(sat, other.sat)
				&& Objects.equals(satDes, other.satDes) && Objects.equals(status, other.status)
				&& Objects.equals(sun, other.sun) && Objects.equals(sunDes, other.sunDes)
				&& Objects.equals(thu, other.thu) && Objects.equals(thuDes, other.thuDes)
				&& Objects.equals(tue, other.tue) && Objects.equals(tueDes, other.tueDes)
				&& Objects.equals(wDate, other.wDate) && Objects.equals(wed, other.wed)
				&& Objects.equals(wedDes, other.wedDes);
	}

	@Override
	public String toString() {
		return "Work2 [id=" + id + ", empId=" + empId + ", projectId=" + projectId + ", projectName=" + projectName
				+ ", wDate=" + wDate + ", mon=" + mon + ", monDes=" + monDes + ", tue=" + tue + ", tueDes=" + tueDes
				+ ", wed=" + wed + ", wedDes=" + wedDes + ", thu=" + thu + ", thuDes=" + thuDes + ", fri=" + fri
				+ ", friDes=" + friDes + ", sat=" + sat + ", satDes=" + satDes + ", sun=" + sun + ", sunDes=" + sunDes
				+ ", status=" + status + "]";
	}

}
