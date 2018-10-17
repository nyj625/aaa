package Dao_service;

import java.util.List;

import Info.SearchInfo;
import entity.operator;

public interface operator_service {
	public List<operator> select(SearchInfo s);
		
	public void insert(operator o);
	
	public void delete(int id);
	
	public void update(operator o);
	
	public operator selectbyID(int id);
	public operator login(String nike);
	
	public operator selectname(String name);
}
