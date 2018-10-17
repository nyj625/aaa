package Dao_service;

import java.util.List;

import Info.SearchInfo;
import entity.activity_notice;

public interface activity_notice_service {
	
    public List<activity_notice> select(SearchInfo info);
	
	public void insert(activity_notice n);
	
	public void update(activity_notice n);
	
	public void delete(int id);
	
	public activity_notice getById(int id);

}
