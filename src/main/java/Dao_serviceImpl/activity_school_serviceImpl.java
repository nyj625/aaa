package Dao_serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Dao.activity_school_dao;
import Dao_service.activity_school_service;
import Info.SearchInfo;
import entity.activity_school;



@Service
public class activity_school_serviceImpl implements activity_school_service {

	@Autowired
	activity_school_dao dao;	
	
	public List<activity_school> select(SearchInfo info) {
		return dao.select(info);
	}
	public void insert(activity_school s) {
		dao.insert(s);
	}
	public void update(activity_school s) {
        dao.update(s);
		
	}
	public void delete(int id) {
		dao.delete(id);
	}
	public activity_school getById(int id) {
		return dao.getById(id);
	}
	
	

}
