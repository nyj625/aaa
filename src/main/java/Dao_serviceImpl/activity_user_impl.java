package Dao_serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Dao.activity_user_dao;
import Dao_service.activity_user_service;
import Info.SearchInfo;
import entity.activity_user;

@Service
public class activity_user_impl implements activity_user_service {
	 

	
	
	@Autowired
	activity_user_dao dao;

		public List<activity_user> select(SearchInfo u) {
		return dao.select(u);
	}
	
		public void delete(int id) {
			dao.delete(id);
		}

		public void insert(activity_user u) {
			dao.insert(u);
		}

		public void update(activity_user u) {
			 dao.update(u);
		}

		public activity_user selectbyID(int id) {
			return dao.selectbyID(id);
		}
		
	
		
		public activity_user login(activity_user u) {
			return dao.login(u);
		}
		
		public int selectmax() {
			
			return dao.selectmax();
		}
}
