package Dao_serviceImpl;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Dao.activity_usergroup_dao;
import Dao_service.activity_usergroup_service;
import Info.SearchInfo;
import entity.activity_usergroup;
@Service
public class activity_usergroup_Impl implements activity_usergroup_service{
@Autowired
activity_usergroup_dao dao;

public List<activity_usergroup> select(SearchInfo info) {
	
	return dao.select(info);
}

public void upadate(activity_usergroup user) {
	dao.upadate(user);
	
}

public void delete(int id) {
	dao.delete(id);
	
}

public void insert(activity_usergroup user) {
	dao.insert(user);
	
}

public activity_usergroup selectbyId(int id) {

	return dao.selectbyId(id);
}




}
