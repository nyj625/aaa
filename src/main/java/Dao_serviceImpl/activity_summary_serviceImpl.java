package Dao_serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Dao.activity_summary_dao;
import Dao_service.activity_summary_service;
import Info.SearchInfo;
import entity.activity_summary;
@Service
public class activity_summary_serviceImpl implements activity_summary_service {

	@Autowired
	activity_summary_dao dao;	
	
	public List<activity_summary> select(SearchInfo info) {
		return dao.select(info);
	}
	public void insert(activity_summary s) {
		dao.insert(s);
	}
	public void update(activity_summary s) {
        dao.update(s);
		
	}
	public void delete(int id) {
		dao.delete(id);
	}
	public activity_summary getById(int id) {
		
		return dao.getById(id);
	}

}
