package Dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import Info.SearchInfo;
import entity.activity_school;


@Repository
public interface activity_school_dao {
	@Select("select * from activity_school")
    public List<activity_school> select(SearchInfo info);
	
	@Insert("insert into activity_school (name) values(#{name})")
	public void insert(activity_school s);
	
	@Insert("update activity_school set name=#{name} where id=#{id}")
	public void update(activity_school s);
	
	@Delete("delete from activity_school where id=#{id}")
	public void delete(int id);
	
	@Select("select * from activity_school where id=#{id}")
	public activity_school getById(int id);
	
	
}
