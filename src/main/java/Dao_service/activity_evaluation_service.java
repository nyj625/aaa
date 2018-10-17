package Dao_service;

import java.util.List;

import Info.SearchInfo;
import entity.activity_evaluation;

public interface activity_evaluation_service {
	

	public List<activity_evaluation> select(SearchInfo s);
	

	public void delete(int id);

	
	public void insert(activity_evaluation u);

	
	public int update(activity_evaluation u);

	
	public activity_evaluation selectbyID(int id);
	
	
}
