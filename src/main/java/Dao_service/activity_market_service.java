package Dao_service;

import java.util.List;

import Info.SearchInfo;
import entity.activity_market;

public interface activity_market_service {
	public List<activity_market> select(SearchInfo s);
		
	public void insert(activity_market o);
	
	public void delete(int id);
	
	public void update(activity_market o);
	
	public activity_market selectbyID(int id);

	public activity_market selectname(SearchInfo s);
	
	public activity_market selectsj(int id);
	
	public void studentup(activity_market o);

	
}
