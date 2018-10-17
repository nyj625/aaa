package Dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import Info.SearchInfo;
import entity.activity;
@Repository
public interface activity_dao {

	@Select("select * from activity ${where} ${limit}")
	public List<activity> select(SearchInfo s);


	@Insert("insert into activity (school_id,college_id,count,classcount,source_operator_id,"
			+ "type,instructor_user_id,operator_id,charge_operator_id,status,comments,"
			+ "createdate,attention,options,name,dateinfo,planinfo,courseinfo,ids)  "
			+ "values(#{school_id},#{college_id},#{count},#{classcount},#{source_operator_id},"
			+ "#{type},#{instructor_user_id},#{operator_id},#{charge_operator_id},#{status},"
			+ "#{comments},#{createdate},#{attention},#{options},#{name},#{dateinfo},#{planinfo},"
			+ "#{courseinfo},#{ids})")
	public void insert(activity o);

	@Delete("delete from activity where id=#{id}")
	public void delete(int id);

	@Update("update activity set school_id=#{school_id},college_id=#{college_id},"
			+ "count=#{count},classcount=#{classcount},courseinfo=#{courseinfo},"
			+ " source_operator_id=#{source_operator_id},type=#{type},"
			+ "	instructor_user_id=#{instructor_user_id},operator_id=#{operator_id},"
			+ "charge_operator_id=#{charge_operator_id},comments=#{comments},status=#{status},"
			+ "attention=#{attention},options=#{options},name=#{name},"
			+ "dateinfo=#{dateinfo} where id=#{id}")
	public int update(activity o);
	
	@Update("update activity set status=1 where id=#{id}")
	public int cancel(int id);

	@Update("update activity set status=0 where id=#{id}")
	public int restart(int id);
	
	//查询一条记录
	@Select("select * from activity where id=#{id}")
	public activity selectbyID(int id);
	
	
	@Select("select a.*,sc.name sc_name,co.name co_name from activity a inner join,"
			+ "activity_school sc on sc.id=a.school_id inner join activity_college co on a.college_id=co.id "
			)
	public activity selectname(SearchInfo s);
	
	@Select(" select a.*,o.name operator_name from operator o inner join activity a on a.operator_id=o.id ${where} ${limit}")
	public activity selectopname(SearchInfo s);
	
	@Select(" select a.*,o.name source_operatorname from operator o inner join activity a on a.source_operator_id=o.id ${where} ${limit}")
	public activity selectsoname(SearchInfo s);
	
	@Select(" select a.*,o.name charge_operatorname from operator o inner join activity a on a.charge_operator_id=o.id ${where} ${limit}")
	public activity selectchname(SearchInfo s);
	
	@Select(" select a.*,u.name charge_operatorname from activity_user u inner join activity a on a.Instructor_user_id=u.id ${where} ${limit}")
	public activity selectinname(SearchInfo s);
	
	@Update(" update activity set ids=#{ids} where id=#{id}")
	public void updateIds(activity a);
	
	@Select("select max(id) id from activity")
	public int getMaxId();
}
