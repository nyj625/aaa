package entity;

public class operator {
int id;
int type;
int power;
int status;
String niki;
String name;
String pass;
String comments;
String tel;
public static String [] powerlist= {"操作","管理"};
public static String [] statuslist= {"在职","离职"};
public static String [] typelist= {"讲师","市场","后勤","人事"};
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public int getType() {
	return type;
}
public void setType(int type) {
	this.type = type;
}
public int getPower() {
	return power;
}
public void setPower(int power) {
	this.power = power;
}
public int getStatus() {
	return status;
}
public void setStatus(int status) {
	this.status = status;
}

public String getNiki() {
	return niki;
}
public void setNiki(String niki) {
	this.niki = niki;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getPass() {
	return pass;
}
public void setPass(String pass) {
	this.pass = pass;
}
public String getComments() {
	return comments;
}
public void setComments(String comments) {
	this.comments = comments;
}
public String getTel() {
	return tel;
}
public void setTel(String tel) {
	this.tel = tel;
}
public  String getPowerlist() {
	return powerlist[power];
}

public  String getStatuslist() {
	return statuslist[status];
}

public  String getTypelist() {
	return typelist[type];
}


}
