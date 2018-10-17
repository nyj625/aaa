package entity;


public class activity_evaluation{

	public  String [] sstatus= {"ÒÑ²âÆÀ","Î´²âÆÀ"};
	
	private int id;
	private int activity_id;
	private int operater_id;
	private int user_id;
	private int point;
	private int status;
	private String comments;
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
	
	
	
	public int getOperater_id() {
		return operater_id;
	}
	public void setOperater_id(int operater_id) {
		this.operater_id = operater_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
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
	public String getSstatus() {
		return sstatus[status];
	}
	public void setSstatus(String[] sstatus) {
		this.sstatus = sstatus;
	}
	
	
	
	
	
}
