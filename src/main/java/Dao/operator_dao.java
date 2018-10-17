package Dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import Info.SearchInfo;
import entity.operator;
@Repository
public interface operator_dao {
	@Select("select * from operator ${where} ${limit}")
	public List<operator> select(SearchInfo s);

	@Select("select * from operator where niki=#{niki}")
	public operator login(String nike);
	
	
	@Insert("insert into operator (niki,pass,name,tel,comments,type,power,status) values(#{niki},#{pass},#{name},#{tel},#{comments},#{type},#{power},#{status})")
	public void insert(operator o);//������ʱ������ʾ״̬�������

	@Delete("delete from operator where id=#{id}")
	public void delete(int id);//���������Զ�ֲ�����

	@Update("update operator set niki=#{niki},pass=#{pass}"
			+ ",name=#{name},tel=#{tel},comments=#{comments},"
			+ " type=#{type},power=#{power},"
			+ "	status=#{status} where id=#{id}")
	public int update(operator o);

	@Select("select * from operator where name=#{name}")
	public operator selectname(String name);
	//��ѯһ����¼
	@Select("select * from operator where id=#{id}")
	public operator selectbyID(int id);
}
