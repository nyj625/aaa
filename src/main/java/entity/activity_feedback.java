package entity;

import org.springframework.stereotype.Component;
@Component
public class activity_feedback {
	
	
	

	private int id;
	private int activity_id;
	private int user_id;
	private String opt1;//问题
	private	String opt2;
	private String opt3;
	private String opt4;
	private String opt5;
	private String opt6;
	private String opt7;
	private String opt8;
	private String opt9;
	private String opt10;
	
	private String text1;//答案
	private String text2;
	private String text3;
	private String text4;
	private String text5;
	private String text6;
	private String text7;
	private String text8;
	private String text9;
	private String text10;
	
	private String result;
	private int status;
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
	
	
	//问题
	public String getOpt1() {
		return opt1;
	}
	public void setOpt1(String opt1) {
		this.opt1 = opt1;
	}
	public String getOpt2() {
		return opt2;
	}
	public void setOpt2(String opt2) {
		this.opt2 = opt2;
	}
	public String getOpt3() {
		return opt3;
	}
	public void setOpt3(String opt3) {
		this.opt3 = opt3;
	}
	public String getOpt4() {
		return opt4;
	}
	public void setOpt4(String opt4) {
		this.opt4 = opt4;
	}
	public String getOpt5() {
		return opt5;
	}
	public void setOpt5(String opt5) {
		this.opt5 = opt5;
	}
	public String getOpt6() {
		return opt6;
	}
	public void setOpt6(String opt6) {
		this.opt6 = opt6;
	}
	public String getOpt7() {
		return opt7;
	}
	public void setOpt7(String opt7) {
		this.opt7 = opt7;
	}
	public String getOpt8() {
		return opt8;
	}
	public void setOpt8(String opt8) {
		this.opt8 = opt8;
	}
	public String getOpt9() {
		return opt9;
	}
	public void setOpt9(String opt9) {
		this.opt9 = opt9;
	}
	public String getOpt10() {
		return opt10;
	}
	public void setOpt10(String opt10) {
		this.opt10 = opt10;
	}
	
	
	
	
	
	//答案
	public String getText1() {
		return text1;
	}
	public void setText1(String text1) {
		this.text1 = text1;
	}
	public String getText2() {
		return text2;
	}
	public void setText2(String text2) {
		this.text2 = text2;
	}
	public String getText3() {
		return text3;
	}
	public void setText3(String text3) {
		this.text3 = text3;
	}
	public String getText4() {
		return text4;
	}
	public void setText4(String text4) {
		this.text4 = text4;
	}
	public String getText5() {
		return text5;
	}
	public void setText5(String text5) {
		this.text5 = text5;
	}
	public String getText6() {
		return text6;
	}
	public void setText6(String text6) {
		this.text6 = text6;
	}
	public String getText7() {
		return text7;
	}
	public void setText7(String text7) {
		this.text7 = text7;
	}
	public String getText8() {
		return text8;
	}
	public void setText8(String text8) {
		this.text8 = text8;
	}
	public String getText9() {
		return text9;
	}
	public void setText9(String text9) {
		this.text9 = text9;
	}
	public String getText10() {
		return text10;
	}
	public void setText10(String text10) {
		this.text10 = text10;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	

	
}
