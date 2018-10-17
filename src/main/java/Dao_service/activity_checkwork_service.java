package Dao_service;

import java.util.List;

import Info.SearchInfo;
import entity.activity_checkwork;

public interface activity_checkwork_service {
	public List<activity_checkwork> select(SearchInfo s);
		
	public void insert(activity_checkwork o);
	
	public void delete(int id);
	
	public void update(activity_checkwork o);
	
	public activity_checkwork selectbyID(int id);

	public List<activity_checkwork> selectname(SearchInfo s);
	
	public List<activity_checkwork> selectids(SearchInfo s);
	
	public void uplist(SearchInfo info);
}
