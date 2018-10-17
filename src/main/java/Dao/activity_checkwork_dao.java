package Dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import Info.SearchInfo;
import entity.activity_checkwork;
@Repository
public interface activity_checkwork_dao {
	@Select("select * from activity_checkwork ${where} ${limit}")
	public List<activity_checkwork> select(SearchInfo s);


	@Insert("insert into activity_checkwork (activity_id,user_id,operator_id,date,check1,check2,check3,lastdate,comments,time_id) "
			+ "values(#{activity_id},#{user_id},#{operator_id},#{date},#{check1},#{check2},#{check3},#{lastdate},#{comments},#{time_id})")
	public void insert(activity_checkwork o);//新增的时候能显示状态传软参数

	@Delete("delete from activity_checkwork where id=#{id}")
	public void delete(int id);//基本类型自动植入参数

	@Update("update activity_checkwork set "
			+ "operator_id=#{operator_id},check1=#{check1},"
			+ " check2=#{check2},check3=#{check3},"
			+ "	lastdate=#{lastdate},comments=#{comments} where id=#{id}")
	public int update(activity_checkwork o);

	
	//查询一条记录
	@Select("select * from activity_checkwork where id=#{id}")
	public activity_checkwork selectbyID(int id);
	
	
	@Select("select checks.*,u.name user_name,a.name activity_name, o.name operator_name from activity_checkwork checks inner join activity_user u"
			+ " on u.id=checks.user_id inner join activity a on a.id=checks.activity_id inner join operator o on o.id=checks.operator_id ${where} ${limit}")
	public List<activity_checkwork> selectname(SearchInfo s);
	
	@Select(" select checks.* from activity_checkwork checks where id in ${ids1}")
	public List<activity_checkwork> selectids(SearchInfo s);
	
	@Update("update activity_checkwork ${where} ")
	public void uplist(SearchInfo info);
}
