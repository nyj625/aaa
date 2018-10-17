package Dao_service;

import java.util.List;

import Info.SearchInfo;
import entity.activity_usergroup;

public interface activity_usergroup_service {
	public  List<activity_usergroup> select(SearchInfo info);
	
	public void upadate(activity_usergroup user);
	
	public void delete(int id);
	
	public void insert(activity_usergroup user);
	
	public activity_usergroup selectbyId(int id);
}
