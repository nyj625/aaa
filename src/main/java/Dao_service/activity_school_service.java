package Dao_service;

import java.util.List;

import Info.SearchInfo;
import entity.activity_school;




public interface activity_school_service {
    public List<activity_school> select(SearchInfo info);
	
	public void insert(activity_school s);
	
	public void update(activity_school s);
	
	public void delete(int id);
	
	public activity_school getById(int id);
}
