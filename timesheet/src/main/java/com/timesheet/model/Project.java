package com.timesheet.model;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.ColumnResult;
import javax.persistence.ConstructorResult;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.NamedNativeQuery;
import javax.persistence.SqlResultSetMapping;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;
import org.springframework.data.annotation.CreatedBy;
import org.springframework.data.annotation.LastModifiedBy;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.timesheet.dto.ProjectWiseOvershot;

// @formatter:off
@NamedNativeQuery(
		name =  "find_project_wise_overshot", 
		query = "select project_name , sum(hour) p_tol_hour, (project_day*24) p_exp_hour from "+
				"timesheet_project_master pm , timesheet_day_sheet ds where  pm.project_id = ds.project_id "+
				"group by  project_name ,project_day", 
		resultSetMapping = "find_project_wise_overshot_dto")
@SqlResultSetMapping(name = "find_project_wise_overshot_dto", 
	classes = @ConstructorResult(targetClass = ProjectWiseOvershot.class, 
	columns = {
			@ColumnResult(name = "project_name", type = String.class),
			@ColumnResult(name = "p_tol_hour", type = Integer.class),
			@ColumnResult(name = "p_exp_hour", type = Integer.class) 
		}))
// @formatter:on
@Entity
@Table(name = "timesheet_project_master")
public class Project {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "project_id")
	private int projectId;

	@Column(name = "project_name")
	private String projectName;

	@Column(name = "project_status")
	private int projectStatus;

	@Column(name = "project_day")
	private int projectDay;

	@JsonBackReference(value = "customer-project")
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "customer_id")
	private Customer customer;

//	for user project mapping 
//	@Transient
//	@JsonIgnore
//	@ManyToMany(fetch = FetchType.LAZY)
//	@JoinColumn(name = "emp_id")
//	@JsonManagedReference
//	@JsonManagedReference(value = "user-project")

	@JsonBackReference
	@ManyToMany(mappedBy = "project", fetch = FetchType.LAZY)
	private List<User> user;

	@CreationTimestamp
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "create_time", updatable = false)
	private Date createTime;

	@CreatedBy
	@Column(name = "created_by")
	String createdBy;

	@UpdateTimestamp
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "modify_time")
	private Date modifyTime;

	@LastModifiedBy
	@Column(name = "modified_by")
	String modifiedBy;

	public Project() {
		super();
	}

	public Project(int projectId, String projectName, int projectStatus, int projectDay, Customer customer,
			List<User> user) {
		super();
		this.projectId = projectId;
		this.projectName = projectName;
		this.projectStatus = projectStatus;
		this.projectDay = projectDay;
		this.customer = customer;
		this.user = user;
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

	public int getProjectStatus() {
		return projectStatus;
	}

	public void setProjectStatus(int projectStatus) {
		this.projectStatus = projectStatus;
	}

	public int getProjectDay() {
		return projectDay;
	}

	public void setProjectDay(int projectDay) {
		this.projectDay = projectDay;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public List<User> getUser() {
		return user;
	}

	public void setUser(List<User> user) {
		this.user = user;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public String getCreateTimeSort() {
		return createTime.toLocaleString().substring(0, 11);
	}

	public String getCreateTimeSort2() {
		return createTime.toLocaleString().substring(0, 11);
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getModifyTime() {
		return modifyTime;
	}

	public void setModifyTime(Date modifyTime) {
		this.modifyTime = modifyTime;
	}

}
