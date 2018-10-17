package entity;


import org.springframework.stereotype.Repository;

@Repository
public class activity_user {
	private Integer id;
	private String niki;
	private String pass;
	private String name;
	private int sex;
	private int type;
	private String tel;
	private String qq;
	private String classinfo;
	private int ylevel;
	private int glevel;
	private int slevel;
	private int school_id;
	private int college_id;
	private int status;
	private String info;
	private String createdate;
	private int operator_id;
	private String comments;
	
	
	public activity_user(String niki, String pass, String name, int sex, int type, String tel, String qq,
			String classinfo, int ylevel, int glevel, int slevel, int school_id, int college_id, int status,
			String info, String createdate, int operator_id, String comments) {
		super();
		this.niki = niki;
		this.pass = pass;
		this.name = name;
		this.sex = sex;
		this.type = type;
		this.tel = tel;
		this.qq = qq;
		this.classinfo = classinfo;
		this.ylevel = ylevel;
		this.glevel = glevel;
		this.slevel = slevel;
		this.school_id = school_id;
		this.college_id = college_id;
		this.status = status;
		this.info = info;
		this.createdate = createdate;
		this.operator_id = operator_id;
		this.comments = comments;
	}
	public activity_user() {
		super();
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getNiki() {
		return niki;
	}
	public void setNiki(String niki) {
		this.niki = niki;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getSex() {
		return sex;
	}
	public void setSex(int sex) {
		this.sex = sex;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getQq() {
		return qq;
	}
	public void setQq(String qq) {
		this.qq = qq;
	}
	public String getClassinfo() {
		return classinfo;
	}
	public void setClassinfo(String classinfo) {
		this.classinfo = classinfo;
	}
	public int getYlevel() {
		return ylevel;
	}
	public void setYlevel(int ylevel) {
		this.ylevel = ylevel;
	}
	public int getGlevel() {
		return glevel;
	}
	public void setGlevel(int glevel) {
		this.glevel = glevel;
	}
	public int getSlevel() {
		return slevel;
	}
	public void setSlevel(int slevel) {
		this.slevel = slevel;
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
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public String getInfo() {
		return info;
	}
	public void setInfo(String info) {
		this.info = info;
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
	public String getComments() {
		return comments;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	
	
}
