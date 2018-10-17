package Dao_service;

import java.util.List;

import Info.SearchInfo;
import entity.activity_feedback;

public interface activity_feedback_service {

	public List<activity_feedback> select(SearchInfo s);
	
	
	public void delete(int id);
	
	
	public activity_feedback selectbyID(int id);
	
	
	public void insert(activity_feedback s);

	
	public int update(activity_feedback s);
	

	public int updateo(activity_feedback s);

}
