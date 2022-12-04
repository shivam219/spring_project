package com.timesheet.model;

import java.util.Objects;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.Type;

@Entity
@Table(name = "timesheet_month_sheet")
public class MonthSheet {
	@Id
	@GeneratedValue
	@Column(name = "month_sheet_id")
	private long monthSheetId;

	@ManyToOne
	@JoinColumn(name = "emp_id")
	private User user;

	@Type(type = "yes_no")
	private boolean submit;

	private String submitDate;

	@Type(type = "yes_no")
	@Column(name = "approved")
	private boolean approved;

//	@Type(type = "yes_no")
//	@Column(name = "reject")
//	private boolean reject;

	private String month;
//	getting error 
//	@OneToMany(mappedBy = "monthId", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
//	private List<DaySheet> sheets = new ArrayList<DaySheet>();

	public MonthSheet() {
	}

	public MonthSheet(long monthSheetId, User user, boolean submit, String submitDate, boolean approved, String month) {
		super();
		this.monthSheetId = monthSheetId;
		this.user = user;
		this.submit = submit;
		this.submitDate = submitDate;
		this.approved = approved;
		this.month = month;
	}

	public long getMonthSheetId() {
		return monthSheetId;
	}

	public void setMonthSheetId(long monthSheetId) {
		this.monthSheetId = monthSheetId;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public boolean isSubmit() {
		return submit;
	}

	public void setSubmit(boolean submit) {
		this.submit = submit;
	}

	public String getSubmitDate() {
		return submitDate;
	}

	public void setSubmitDate(String submitDate) {
		this.submitDate = submitDate;
	}

	public boolean isApproved() {
		return approved;
	}

	public void setApproved(boolean approved) {
		this.approved = approved;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	@Override
	public String toString() {
		return "MonthSheet [monthSheetId=" + monthSheetId + ", user=" + user + ", submit=" + submit + ", submitDate="
				+ submitDate + ", approved=" + approved + ", month=" + month + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(approved, month, monthSheetId, submit, submitDate, user);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		MonthSheet other = (MonthSheet) obj;
		return approved == other.approved && Objects.equals(month, other.month) && monthSheetId == other.monthSheetId
				&& submit == other.submit && Objects.equals(submitDate, other.submitDate)
				&& Objects.equals(user, other.user);
	}

}
