package entity;

import org.springframework.stereotype.Component;

@Component
public class activity_report {

	int id;
	int activity_id;
	int operator_id;
	String date;
	String tprogress;
	String sprogress;
	String cprogress;
	String  studentinfo;
	String comments;
	int time_id;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getActivity_id() {
		return activity_id;
	}
	public void setActivity_id(int activity_id) {
		this.activity_id = activity_id;
	}
	public int getOperator_id() {
		return operator_id;
	}
	public void setOperator_id(int operator_id) {
		this.operator_id = operator_id;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getTprogress() {
		return tprogress;
	}
	public void setTprogress(String tprogress) {
		this.tprogress = tprogress;
	}
	public String getSprogress() {
		return sprogress;
	}
	public void setSprogress(String sprogress) {
		this.sprogress = sprogress;
	}
	public String getCprogress() {
		return cprogress;
	}
	public void setCprogress(String cprogress) {
		this.cprogress = cprogress;
	}
	public String getStudentinfo() {
		return studentinfo;
	}
	public void setStudentinfo(String studentinfo) {
		this.studentinfo = studentinfo;
	}
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public int getTime_id() {
		return time_id;
	}
	public void setTime_id(int time_id) {
		this.time_id = time_id;
	}
	
	
	
	
	
	
}
