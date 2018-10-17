package Dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import Info.SearchInfo;
import entity.activity_market;
@Repository
public interface activity_market_dao {
	@Select("select m.*,a.name activity_name,o.name operator_name from activity_market m inner join activity a on a.id=m.activity_id inner join operator o on o.id=m.operator_id ${where} ${limit}")
	public List<activity_market> select(SearchInfo s);


	@Insert("insert into activity_market (activity_id"
			+ ",operator_id,date,info,studentjson,comments) "
			+ "values(#{activity_id},#{operator_id},#{date},#{info},#{studentjson},#{comments})")
	public void insert(activity_market o);//������ʱ������ʾ״̬�������

	@Delete("delete from activity_market where id=#{id}")
	public void delete(int id);//���������Զ�ֲ�����

	@Update("update activity_market set activity_id=#{activity_id}"
			+ ",operator_id=#{operator_id},"			
			+ "	info=#{info},comments=#{comments} where id=#{id}")
	public void update(activity_market o);

	@Update("update activity_market set studentjson=#{studentjson} where id=#{id}")
	public void studentup(activity_market o);
	//��ѯһ����¼
	@Select("select * from activity_market where id=#{id}")
	public activity_market selectbyID(int id);
	
	
	@Select("select market.*,o.name operator_name,a.name activity_name from activity_market market inner join operator o"
			+ " on o.id=market.operator_id inner join activity a on a.id=market.activity_id ")
	public activity_market selectname(SearchInfo s);
	
	@Select(" select activity_market.studentjson from activity_market where activity_id=#{activity_id}")
	public activity_market selectsj(int id);
	

}
