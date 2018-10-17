package entity;

public class activity_market {
private int id;
private int activity_id;
private int operator_id;
private String date;
private String info;
private String studentjson;
public String getInfo() {
	return info;
}

public void setInfo(String info) {
	this.info = info;
}

public String getStudentjson() {
	return studentjson;
}

public void setStudentjson(String studentjson) {
	this.studentjson = studentjson;
}
private String comments;
private String activity_name;
private String operator_name;


public activity_market() {
	super();
}

public String getActivity_name() {
	return activity_name;
}

public void setActivity_name(String activity_name) {
	this.activity_name = activity_name;
}

public String getOperator_name() {
	return operator_name;
}

public void setOperator_name(String operator_name) {
	this.operator_name = operator_name;
}

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


public String getComments() {
	return comments;
}
public void setComments(String comments) {
	this.comments = comments;
}

}
