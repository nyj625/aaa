package Dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import Info.SearchInfo;
import entity.activity_summary;
@Repository
public interface activity_summary_dao {
	@Select("select activity_summary.*, o.name o_name,t.name t_name from activity_summary "
			+ "inner join operator o on activity_summary.operator_id=o.id"
			+ " inner join activity t on activity_summary.activity_id=t.id ${where} ${limit}")    
	public List<activity_summary> select(SearchInfo info);
	
	@Insert("insert into activity_summary (activity_id,operator_id,createdate,opt,sstatus,tstatus,cstatus,xstatus,summary,proposal,comments) values(#{activity_id},#{operator_id},#{createdate},#{opt},#{sstatus},#{tstatus},#{cstatus},#{xstatus},#{summary},#{proposal},#{comments})")
	public void insert(activity_summary s);
	
	@Update("update activity_summary set activity_id=#{activity_id},operator_id=#{operator_id},createdate=#{createdate},opt=#{opt},sstatus=#{sstatus},tstatus=#{tstatus},cstatus=#{cstatus},xstatus=#{xstatus},summary=#{summary},proposal=#{proposal},comments=#{comments} where id=#{id}")
	public void update(activity_summary s);
	
	@Delete("delete from activity_summary where id=#{id}")
	public void delete(int id);
	
	@Select("select * from activity_summary where id=#{id}")
	public activity_summary getById(int id);
	
	
}
