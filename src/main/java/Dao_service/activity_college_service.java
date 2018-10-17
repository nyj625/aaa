package Dao_service;

import java.util.List;

import Info.SearchInfo;
import entity.activity_college;


public interface activity_college_service {
	
    public List<activity_college> select(SearchInfo info);
	
	public void insert(activity_college c);
	
	public void update(activity_college c);
	
	public void delete(int id);
	
	public activity_college getById(int id);

}
