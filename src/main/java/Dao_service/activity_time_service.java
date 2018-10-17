package Dao_service;

import java.util.List;

import Info.SearchInfo;
import entity.activity_time;

public interface activity_time_service {
	
    public List<activity_time> select(SearchInfo info);
	
	public void insert(activity_time t);
	
	public void update(activity_time t);
	
	public void delete(int id);
	
	public activity_time getById(int id);
	
	public int getMaxId();

}
