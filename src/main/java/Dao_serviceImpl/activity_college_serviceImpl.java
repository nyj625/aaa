package Dao_serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Dao.activity_college_dao;
import Dao_service.activity_college_service;
import Info.SearchInfo;
import entity.activity_college;

@Service
public class activity_college_serviceImpl implements activity_college_service {

	@Autowired
	activity_college_dao dao;	
	
	public List<activity_college> select(SearchInfo info) {
		return dao.select(info);
	}
	public void insert(activity_college c) {
		dao.insert(c);
	}
	public void update(activity_college c) {
        dao.update(c);
		
	}
	public void delete(int id) {
		dao.delete(id);
	}
	public activity_college getById(int id) {
		
		return dao.getById(id);
	}

}
