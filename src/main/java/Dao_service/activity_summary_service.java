package Dao_service;

import java.util.List;

import Info.SearchInfo;
import entity.activity_summary;

public interface activity_summary_service {
	
    public List<activity_summary> select(SearchInfo info);
	
	public void insert(activity_summary s);
	
	public void update(activity_summary s);
	
	public void delete(int id);
	
	public activity_summary getById(int id);

}
