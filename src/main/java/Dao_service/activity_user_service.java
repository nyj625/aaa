package Dao_service;

import java.util.List;

import Info.SearchInfo;
import entity.activity_user;

public interface activity_user_service {


	public List<activity_user> select(SearchInfo u);
	

	public void delete(int id);


	public void insert(activity_user u);

	
	public void update(activity_user u);

	
	public activity_user selectbyID(int id);

	
	
	public activity_user login(activity_user u);
	
	public int selectmax();
}
