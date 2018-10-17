package Dao_service;

import java.util.List;

import Info.SearchInfo;
import entity.activity;

public interface activity_service {
	public List<activity> select(SearchInfo s);
		
	public void insert(activity o);
	
	public void delete(int id);
	
	public void update(activity o);
	
	public activity selectbyID(int id);

	public activity selectname(SearchInfo s);
	
	public void cancel(int id);
	
	public void restart(int id);
	
	public void updateIds(activity a);
	
	public int getMaxId();
}
