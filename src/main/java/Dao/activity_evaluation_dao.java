package Dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import Info.SearchInfo;
import entity.activity_evaluation;

@Repository
public interface activity_evaluation_dao {
	
		
			@Select("select * from activity_evaluation ${where} ${limit}")
			public List<activity_evaluation> select(SearchInfo s);
			
		
			@Delete("delete from activity_evaluation where id=#{id}")
			public void delete(int id);

		
			@Insert("insert into activity_evaluation (activity_id,operater_id,user_id,point,status,comments) "
					+ "values(#{activity_id},#{operater_id},#{user_id},#{point},#{status},#{comments})")
			public void insert(activity_evaluation u);

			
			@Update("update activity_evaluation set activity_id=#{activity_id},operater_id=#{operater_id},user_id=#{user_id},point=#{point},status=#{status},comments=#{comments} "
					+ "where id=#{id}")
			public int update(activity_evaluation u);

		
			@Select("select * from activity_evaluation where id=#{id}")
			public activity_evaluation selectbyID(int id);
			
			
			
			
}
