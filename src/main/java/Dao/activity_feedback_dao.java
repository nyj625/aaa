package Dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import Info.SearchInfo;
import entity.activity_feedback;

@Repository
public interface activity_feedback_dao {

	
	@Select("select * from activity_feedback ${where} ${limit}")
	public List<activity_feedback> select(SearchInfo s);
	
	
	@Delete("delete from activity_feedback where id=#{id}")
	public void delete(int id);
	
	
	
	@Select("select * from activity_feedback where id=#{id}")
	public activity_feedback selectbyID(int id);
	
	
	@Insert("insert into activity_feedback (activity_id,user_id,opt1,opt2,opt3,opt4,opt5,opt6,opt7,opt8,opt9,opt10,"
			+ "result,status) "
			+ "values(#{activity_id},#{user_id},#{opt1},#{opt2},#{opt3},#{opt4},#{opt5},#{opt6},#{opt7},#{opt8},#{opt9},#{opt10},"
			+ "#{result},#{status})")
	public void insert(activity_feedback s);


	@Update("update activity_feedback set activity_id=#{activity_id},user_id=#{user_id},"
			+ "opt1=#{opt1},opt2=#{opt2},opt3=#{opt3},opt4=#{opt4},opt5=#{opt5},opt6=#{opt6},opt7=#{opt7},opt8=#{opt8},opt9=#{opt9},opt10=#{opt10},"
			+ "result=#{result},status=#{status} where id=#{id}")
	public int update(activity_feedback s);

		
	@Update("update activity_feedback set status=#{status},text1=#{text1},text2=#{text2},text3=#{text3},text4=#{text4},"
			+ "text5=#{text5},text6=#{text6},text7=#{text7},text8=#{text8},text9=#{text9},text10=#{text10} where id=#{id}")
	public int updateo(activity_feedback s);


}
