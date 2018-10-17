package Dao_serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Dao.activity_notice_dao;
import Dao_service.activity_notice_service;
import Info.SearchInfo;
import entity.activity_notice;

@Service
public class activity_notice_serviceImpl implements activity_notice_service {

	@Autowired
	activity_notice_dao dao;	
	
	public List<activity_notice> select(SearchInfo info) {
		return dao.select(info);
	}
	public void insert(activity_notice n) {
		dao.insert(n);
	}
	public void update(activity_notice n) {
        dao.update(n);
		
	}
	public void delete(int id) {
		dao.delete(id);
	}
	public activity_notice getById(int id) {
		
		return dao.getById(id);
	}

}
