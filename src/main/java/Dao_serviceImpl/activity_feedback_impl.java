package Dao_serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import Dao.activity_feedback_dao;
import Dao_service.activity_feedback_service;
import Info.SearchInfo;
import entity.activity_feedback;


@Service
public class activity_feedback_impl implements activity_feedback_service{

	@Autowired
	activity_feedback_dao dao;
	
	public List<activity_feedback> select(SearchInfo s) {
		return  dao.select(s);
	}
	
	public void delete(int id) {
		dao.delete(id);
	}
	
	public activity_feedback selectbyID(int id) {
		return dao.selectbyID(id);
	}

	public void insert(activity_feedback s) {
		dao.insert(s);
		
	}

	public int update(activity_feedback s) {
		
		return dao.update(s);
	}

	public int updateo(activity_feedback s) {
		
		return dao.updateo(s);
	}
	
}
