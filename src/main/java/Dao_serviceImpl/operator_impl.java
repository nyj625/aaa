package Dao_serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Dao.operator_dao;
import Dao_service.operator_service;
import Info.SearchInfo;
import entity.operator;
@Service
public class operator_impl implements operator_service{
@Autowired
operator_dao dao;
	
public operator login(String nike) {
	return dao.login(nike);
}



	public void insert(operator o) {
		dao.insert(o);
		
	}

	public void delete(int id) {
		dao.delete(id);
		
	}

	public void update(operator o) {
		int rs = dao.update(o);
		
		
	}

	public operator selectbyID(int id) {
		
		return dao.selectbyID(id);
	}

	public List<operator> select(SearchInfo s) {
		return dao.select(s);
	}



	public operator selectname(String name) {
		// TODO Auto-generated method stub
		return dao.selectname(name);
	}



	

}
