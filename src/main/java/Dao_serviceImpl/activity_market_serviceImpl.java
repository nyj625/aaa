package Dao_serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Dao.activity_market_dao;
import Dao_service.activity_market_service;
import Info.SearchInfo;
import entity.activity_market;

@Service
public class activity_market_serviceImpl implements activity_market_service {

	@Autowired
	activity_market_dao dao;	
	
	public List<activity_market> select(SearchInfo info) {
		return dao.select(info);
	}
	public void insert(activity_market c) {
		dao.insert(c);
	}
	public void update(activity_market c) {
        dao.update(c);
		
	}
	public void delete(int id) {
		dao.delete(id);
	}
	
	public activity_market selectbyID(int id) {
		
		return dao.selectbyID(id);
	}
	public activity_market selectname(SearchInfo s) {
		
		return dao.selectname(s);
	}
	public activity_market selectsj(int id) {		
		return dao.selectsj(id);
	}
	public void studentup(activity_market o) {
		dao.studentup(o);
		
	}
	

}
