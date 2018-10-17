package Dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import Info.SearchInfo;
import entity.activity_college;
@Repository
public interface activity_college_dao { 
	@Select("select c.*,s.`name` s_name from activity_college c inner join activity_school s on c.school_id=s.id  ${where}")    
	public List<activity_college> select(SearchInfo info);
	
	@Insert("insert into activity_college (name,school_id) values(#{name},#{school_id})")
	public void insert(activity_college c);
	
	@Update("update activity_college set name=#{name},school_id=#{school_id} where id=#{id}")
	public void update(activity_college c);
	
	@Delete("delete from activity_college where id=#{id}")
	public void delete(int id);
	
	@Select("select * from activity_college where id=#{id}")
	public activity_college getById(int id);
	
	
}
