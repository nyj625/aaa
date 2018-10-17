package Dao_serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Dao.activity_dao;
import Dao_service.activity_service;
import Info.SearchInfo;
import entity.activity;

@Service
public class activity_impl implements activity_service{
@Autowired
activity_dao dao;

public List<activity> select(SearchInfo s) {
	// TODO Auto-generated method stub
	return dao.select(s);
}

public void insert(activity o) {
	dao.insert(o);
	
}

public void delete(int id) {
	dao.delete(id);
	
}

public void update(activity o) {
	dao.update(o);
	
}

public activity selectbyID(int id) {
	
	return dao.selectbyID(id);
}

public activity selectname(SearchInfo s) {
	
	return dao.selectname(s);
}

public void cancel(int id) {
	// TODO Auto-generated method stub
	dao.cancel(id);
}

public void restart(int id) {
	// TODO Auto-generated method stub
	dao.restart(id);
}

public void updateIds(activity a) {
	// TODO Auto-generated method stub
	dao.updateIds(a);
}

public int getMaxId() {
	// TODO Auto-generated method stub
	return dao.getMaxId();
}


}
	



