package Dao_serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Dao.activity_evaluation_dao;
import Dao_service.activity_evaluation_service;
import Info.SearchInfo;
import entity.activity_evaluation;

@Service
public class activity_evaluation_impl implements activity_evaluation_service{

	@Autowired
	activity_evaluation_dao dao;
	

	public List<activity_evaluation> select(SearchInfo s) {
		return dao.select(s);
	}


	public void delete(int id) {
		dao.delete(id);
		
	}


	public void insert(activity_evaluation u) {
		dao.insert(u);
	}


	public int update(activity_evaluation u) {
		return dao.update(u);
	}


	public activity_evaluation selectbyID(int id) {
		return dao.selectbyID(id);
	}
	
	
}
