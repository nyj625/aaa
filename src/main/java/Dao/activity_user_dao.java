package Dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import Info.SearchInfo;
import entity.activity_user;


@Repository
public interface activity_user_dao {


	@Select("select * from activity_user ${where} ${limit}")
	public List<activity_user> select(SearchInfo u);
	
	
	
	@Delete("delete from activity_user where id=#{id}")
	public void delete(int id);

	
	@Insert("insert into activity_user(niki,pass,name,sex,type,tel,qq,classinfo"
			+ ",ylevel,glevel,slevel,school_id,college_id,status,info,createdate"
			+ ",operator_id,comments) values(#{niki},#{pass},#{name},#{sex},#{type},#{tel}"
			+ ",#{qq},#{classinfo},#{ylevel},#{glevel},#{slevel},#{school_id},#{college_id}"
			+ ",#{status},#{info},#{createdate},#{operator_id},#{comments})")
	public void insert(activity_user user);

	@Update("update activity_user set niki=#{niki},name=#{name},sex=#{sex},type=#{type},tel=#{tel},"
			+ "qq=#{qq},classinfo=#{classinfo},ylevel=#{ylevel},glevel=#{glevel},slevel=#{slevel},school_id=#{school_id},"
			+ "college_id=#{college_id},classinfo=#{classinfo},status=#{status},info=#{info},comments=#{comments} where id = #{id}")
	public void update(activity_user user);

	
	@Select("select * from activity_user where id=#{id}")
	public activity_user selectbyID(int id);
	
	
	@Select(" select max(ID) from activity_user ")
	public int selectmax();
	
	@Select("select * from activity_user where tel=#{tel} and pass=#{pass}")
	public activity_user login(activity_user u);
	
	
	
	
	
	
	
}
