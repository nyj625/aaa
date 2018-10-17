package Dao_service;

import java.util.List;

import Info.SearchInfo;
import entity.activity_report;


public interface activity_report_service {
	
	
		public List<activity_report> select(SearchInfo s);
	
		
		public void delete(int id);
		
		
		public void insert(activity_report s);
		
		
		public int update(activity_report s);
		
		
		public activity_report selectbyID(int id);
		
		public void updateStudentInfo(activity_report s);

	
}
