package Dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import Info.SearchInfo;
import entity.activity_report;




@Repository
public interface activity_report_dao {

	
		@Select("select * from activity_report ${where} ${limit}")
		public List<activity_report> select(SearchInfo s);
		
		
		@Delete("delete from activity_report where id=#{id}")
		public void delete(int id);

		
		@Insert("insert into activity_report (activity_id,operator_id,date,tprogress,sprogress,cprogress,studentinfo,comments,time_id) values(#{activity_id},#{operator_id},#{date},#{tprogress},#{sprogress},#{cprogress},#{studentinfo},#{comments},#{time_id})")
		public void insert(activity_report s);

		
		@Update("update activity_report set activity_id=#{activity_id},operator_id=#{operator_id},date=#{date},tprogress=#{tprogress},sprogress=#{sprogress},cprogress=#{cprogress},studentinfo=#{studentinfo},comments=#{comments}  where id=#{id}")
		public int update(activity_report s);

		
		@Select("select * from activity_report where id=#{id}")
		public activity_report selectbyID(int id);
		
		@Update("update activity_report set studentinfo = #{studentinfo} where id=#{id}")
		public void updateStudentInfo(activity_report s);
		
}
