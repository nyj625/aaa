package Dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import Info.SearchInfo;
import entity.activity_time;
@Repository
public interface activity_time_dao {
	@Select("select activity_time.*, o.name o_name,t.name t_name from activity_time "
			+ "inner join operator o on activity_time.operator_id=o.id"
			+ " inner join activity t on activity_time.activity_id=t.id ${where}")    
	public List<activity_time> select(SearchInfo info);
	
	@Insert("insert into activity_time (activity_id,date,time1,time2,time3,time4,time5,time6,roominfo,operator_id,status,comments) values(#{activity_id},#{date},#{time1},#{time2},#{time3},#{time4},#{time5},#{time6},#{roominfo},#{operator_id},#{status},#{comments})")
	public void insert(activity_time t);
	
	@Update("update activity_time set activity_id=#{activity_id},date=#{date},time1=#{time1},time2=#{time2},time3=#{time3},time4=#{time4},time5=#{time5},time6=#{time6},roominfo=#{roominfo},operator_id=#{operator_id},status=#{status},comments=#{comments} where id=#{id}")
	public void update(activity_time t);
	
	@Delete("delete from activity_time where id=#{id}")
	public void delete(int id);
	
	@Select("select * from activity_time where id=#{id}")
	public activity_time getById(int id);
	
	@Select("select max(id) id from activity_time")
	public int getMaxId();
	
	
}
