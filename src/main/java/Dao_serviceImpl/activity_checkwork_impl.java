package Dao_serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Dao.activity_checkwork_dao;
import Dao_service.activity_checkwork_service;
import Info.SearchInfo;
import entity.activity_checkwork;

@Service
public class activity_checkwork_impl implements activity_checkwork_service{
@Autowired
activity_checkwork_dao dao;

public List<activity_checkwork> select(SearchInfo s) {
	// TODO Auto-generated method stub
	return dao.select(s);
}

public void insert(activity_checkwork o) {
	dao.insert(o);
	
}

public void delete(int id) {
	dao.delete(id);
	
}

public void update(activity_checkwork o) {
	dao.update(o);
	
}

public activity_checkwork selectbyID(int id) {
	
	return dao.selectbyID(id);
}

public List<activity_checkwork> selectname(SearchInfo s) {
	
	return dao.selectname(s);
}

public List<activity_checkwork> selectids(SearchInfo s) {
	
	return dao.selectids(s);
}

public void uplist(SearchInfo info) {
	dao.uplist(info);
	
}


}
	



