package entity;

public class activity_checkwork {
private int id;
private int activity_id;
private int user_id;
private int operator_id;
private String date;
private int check1;
private int check2;
private int check3;
private int time_id;
private String lastdate;
private String comments;
private String user_name;
private String activity_name;
private String operator_name;
public static String[] check1list= {"正常","迟到","早退","请假","未到"};
public static String [] check2list= {"正常","迟到","早退","请假","未到"};
public static String [] check3list= {"正常","迟到","早退","请假","未到"};
public activity_checkwork() {
	super();
}

public int getTime_id() {
	return time_id;
}

public void setTime_id(int time_id) {
	this.time_id = time_id;
}

public  String getCheck1list() {
	return check1list[check1];
}

public  String getCheck2list() {
	return check2list[check2];
}

public  String getCheck3list() {
	return check3list[check3];
}


public String getOperator_name() {
	return operator_name;
}

public void setOperator_name(String operator_name) {
	this.operator_name = operator_name;
}

public String getUser_name() {
	return user_name;
}

public void setUser_name(String user_name) {
	this.user_name = user_name;
}

public String getActivity_name() {
	return activity_name;
}

public void setActivity_name(String activity_name) {
	this.activity_name = activity_name;
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
public int getUser_id() {
	return user_id;
}
public void setUser_id(int user_id) {
	this.user_id = user_id;
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
	
public int getCheck1() {
	return check1;
}

public void setCheck1(int check1) {
	this.check1 = check1;
}

public int getCheck2() {
	return check2;
}

public void setCheck2(int check2) {
	this.check2 = check2;
}

public int getCheck3() {
	return check3;
}

public void setCheck3(int check3) {
	this.check3 = check3;
}

public String getLastdate() {
	return lastdate;
}
public void setLastdate(String lastdate) {
	this.lastdate = lastdate;
}
public String getComments() {
	return comments;
}
public void setComments(String comments) {
	this.comments = comments;
}

}
