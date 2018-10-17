package Dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import Info.SearchInfo;
import entity.activity_notice;
@Repository
public interface activity_notice_dao {
	@Select("select activity_notice.*, o.name o_name,t.name t_name from activity_notice "
			+ "inner join activity_operator o on activity_notice.operator_id=o.id"
			+ " inner join activity t on activity_notice.activity_id=t.id ${where}")    
	public List<activity_notice> select(SearchInfo info);
	
	@Insert("insert into activity_notice (activity_id,date,operator_id,title,info,status) values(#{activity_id},#{date},#{operator_id},#{title},#{info},#{status})")
	public void insert(activity_notice n);
	
	@Update("update activity_notice set activity_id=#{activity_id},date=#{date},operator_id=#{operator_id},title=#{title},info=#{info},status=#{status} where id=#{id}")
	public void update(activity_notice n);
	
	@Delete("delete from activity_notice where id=#{id}")
	public void delete(int id);
	
	@Select("select * from activity_notice where id=#{id}")
	public activity_notice getById(int id);
	
	
}
