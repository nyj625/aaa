package Dao_serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Dao.activity_time_dao;
import Dao_service.activity_time_service;
import Info.SearchInfo;
import entity.activity_time;

@Service
public class activity_time_serviceImpl implements activity_time_service {

	@Autowired
	activity_time_dao dao;	
	
	public List<activity_time> select(SearchInfo info) {
		return dao.select(info);
	}
	public void insert(activity_time t) {
		dao.insert(t);
	}
	public void update(activity_time t) {
        dao.update(t);
		
	}
	public void delete(int id) {
		dao.delete(id);
	}
	public activity_time getById(int id) {
		
		return dao.getById(id);
	}
	public int getMaxId() {
		// TODO Auto-generated method stub
		return dao.getMaxId();
	}

}
