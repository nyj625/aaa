package Dao_serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Dao.activity_report_dao;
import Dao_service.activity_report_service;
import Info.SearchInfo;
import entity.activity_report;


@Service
public class activity_report_impl implements activity_report_service{

	@Autowired
	activity_report_dao dao;
	
	
	public List<activity_report> select(SearchInfo s) {
		
		return dao.select(s);
	}

	
		public void delete(int id) {
			dao.delete(id);
		}

		public int update(activity_report s) {
			return dao.update(s);
		}

		
		public void insert(activity_report s) {
			 dao.insert(s);
		}
		
	
		public activity_report selectbyID(int id) {
			return dao.selectbyID(id);
		}

		public void updateStudentInfo(activity_report s) {
			// TODO Auto-generated method stub
			dao.updateStudentInfo(s);
		}
}
