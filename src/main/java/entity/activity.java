package entity;

import org.springframework.stereotype.Component;

@Component
public class activity{
	private int id;
	private String courseinfo;
	private String planinfo;
	private String dateinfo;
	private int school_id;
	private int college_id;
	private String name;
	private int count;
	private int classcount;
	private String source_operator_id;
	private String options;
	private String attention;
	private int type;
	private String instructor_user_id;
	private String createdate;
	private int operator_id;
	private int charge_operator_id;
	private int status;
	private String comments;
	private String ids;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCourseinfo() {
		return courseinfo;
	}
	public void setCourseinfo(String courseinfo) {
		this.courseinfo = courseinfo;
	}
	public String getPlaninfo() {
		return planinfo;
	}
	public void setPlaninfo(String planinfo) {
		this.planinfo = planinfo;
	}

	public String getDateinfo() {
		return dateinfo;
	}
	public void setDateinfo(String dateinfo) {
		this.dateinfo = dateinfo;
	}
	public int getSchool_id() {
		return school_id;
	}
	public void setSchool_id(int school_id) {
		this.school_id = school_id;
	}
	public int getCollege_id() {
		return college_id;
	}
	public void setCollege_id(int college_id) {
		this.college_id = college_id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getClasscount() {
		return classcount;
	}
	public void setClasscount(int classcount) {
		this.classcount = classcount;
	}
	public String getSource_operator_id() {
		return source_operator_id;
	}
	public void setSource_operator_id(String source_operator_id) {
		this.source_operator_id = source_operator_id;
	}
	public String getOptions() {
		return options;
	}
	public void setOptions(String options) {
		this.options = options;
	}
	public String getAttention() {
		return attention;
	}
	public void setAttention(String attention) {
		this.attention = attention;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}

	public String getInstructor_user_id() {
		return instructor_user_id;
	}
	public void setInstructor_user_id(String instructor_user_id) {
		this.instructor_user_id = instructor_user_id;
	}
	public String getCreatedate() {
		return createdate;
	}
	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}
	public int getOperator_id() {
		return operator_id;
	}
	public void setOperator_id(int operator_id) {
		this.operator_id = operator_id;
	}
	public int getCharge_operator_id() {
		return charge_operator_id;
	}
	public void setCharge_operator_id(int charge_operator_id) {
		this.charge_operator_id = charge_operator_id;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public String getIds() {
		return ids;
	}
	public void setIds(String ids) {
		this.ids = ids;
	}

}
