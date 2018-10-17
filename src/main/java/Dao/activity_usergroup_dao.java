package Dao;
import java.util.List;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import Info.SearchInfo;
import entity.activity_usergroup;
@Repository
public interface activity_usergroup_dao {
@Select("select * from activity_usergroup ${where} ${limit}")
public  List<activity_usergroup> select(SearchInfo info);

@Update("update activity_usergroup set comments=#{comments},createdate=#{createdate},path=#{path},"
		+ "project=#{project},ids=#{ids},name=#{name},activity_id=#{activity_id},point1=#{point1},"
		+ "point2=#{point2},point3=#{point3},point4=#{point4},point5=#{point5},point6=#{point6},"
		+ "point7=#{point7},point8=#{point8},"
		+ "point9=#{point9},point10=#{point10},operator_id=#{operator_id} where id=#{id}"
		)
public void upadate(activity_usergroup user);


@Delete("delete from activity_usergroup where id=#{id}")
public void delete(int id);

@Insert("insert into activity_usergroup (comments,createdate,path,project,ids,name,activity_id,"
		+ "point1,point2,point3,point4,point5,point6,point7,point8,point9,point10,operator_id) "
		+ "values(#{comments},#{createdate},#{path},#{project},#{ids},"
		+ "#{name},#{activity_id},#{point1},#{point2},#{point3},#{point4},#{point5},#{point6},"
		+ "#{point7},#{point8},#{point9},#{point10},#{operator_id})")
public void insert(activity_usergroup user);

@Select("select * from activity_usergroup where id=#{id}")
public activity_usergroup selectbyId(int id);

@Select("select o.name operator_name,user.*,a.name activity_name from activity_usergroup user inner join operator o on user.operator_id=o.id"
		+ " inner join activity a on a.id=user.activity_id")
public activity_usergroup selectgroup();
}
