package controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.ObjectMapper;

import Dao_service.activity_college_service;
import Dao_service.activity_report_service;
import Dao_service.activity_school_service;
import Dao_service.activity_service;
import Dao_service.activity_user_service;
import Dao_service.operator_service;
import Info.JsonInfo;
import Info.SearchInfo;
import Info.studentjson;
import entity.activity;
import entity.activity_report;
import entity.activity_user;
import entity.operator;


@Controller
@RequestMapping("activity")
public class activity_controller {
	@Autowired
	activity_service service;
	@Autowired
	activity_school_service s_service;
	@Autowired
	activity_college_service c_service;
	@Autowired
	operator_service o_service;
	@Autowired
	activity_user_service u_service;
	@Autowired 
	activity_report_service ar_service;

@RequestMapping("index")
public void select(ModelMap map,String searchType,String txt,SearchInfo s,Integer pageno,String createdate) {
	String where="";
	//if(searchType==null) searchType="''";
	//if(txt==null) txt="";
	if(createdate!=null) {
		
		where=" where createdate="+"'"+createdate+"'";
	}
	if(searchType!=null&&txt!=null) {
		where=" where "+searchType+" like '%"+txt+"%'";
	}
	s.setWhere(where);
	
	List<activity> list=service.select(s);
	
	map.put("list", list);
	map.put("prev", s.getPrev());
	map.put("next", s.getNext());
	s.setPageno(pageno);
	map.put("oper", o_service.select(new SearchInfo()));
}

@RequestMapping("insert")
public @ResponseBody JsonInfo insert(activity ac,ModelMap map,HttpSession session) {
	
	ac.setIds("");
	SimpleDateFormat fmt=new SimpleDateFormat("yyyy-MM-dd");
	ac.setCreatedate(fmt.format(new Date()));
	int operator_id=(Integer) session.getAttribute("operator_id");
	ac.setOperator_id(operator_id);
	service.insert(ac);
	
	activity_report report=new activity_report();
	report.setActivity_id(service.getMaxId());
	report.setOperator_id(-1);
	report.setDate("");
	report.setTprogress("");
	report.setSprogress("");
	report.setCprogress("");
	report.setStudentinfo("");
	report.setComments("");
	report.setTime_id(-1);
	ar_service.insert(report);
	return new JsonInfo(1, "");
}

@RequestMapping("add")
public String edit(ModelMap map) {
	map.put("school", s_service.select(new SearchInfo()));
	map.put("oper",o_service.select(new SearchInfo()));
	return "activity/add-edit";
}

@RequestMapping("edit")
public String updateEdit(ModelMap m,int id) {
	SearchInfo SearchInfo=new SearchInfo();
	SearchInfo.setWhere(" where id ="+id);
	activity ac=service.select(SearchInfo).get(0);
	m.put("info", ac);
	
	m.put("oper", o_service.select(new SearchInfo()));
	m.put("school", s_service.select(new SearchInfo()));
	SearchInfo.setWhere(" where s.id ="+ac.getSchool_id());
	m.put("college",c_service.select(SearchInfo));
	m.put("activity_id", id);
	return "activity/update-edit";
}
@RequestMapping("cancel")
public @ResponseBody String cancel(int id) {
	service.cancel(id);
	return "success";
}

@RequestMapping("restart")
public @ResponseBody String restart(int id) {
	service.restart(id);
	return "success";
}

@RequestMapping("memberSelected")
public String memberSelected(ModelMap m,int activity_id)
{
	
	String ids=service.selectbyID(activity_id).getIds();
	m.put("user", u_service.select(new SearchInfo()));
	m.put("activity_id", activity_id);
	SearchInfo info=new SearchInfo();
	
	if(ids.length()!=0)
	{
		info.setWhere(" where id in ("+ids.substring(1, ids.length())+")");
		System.out.println(ids.substring(1, ids.length()));
		m.put("user_added", u_service.select(info));
	}	
	return "activity/memberSelected";
}

@RequestMapping("update")
public @ResponseBody String update(activity ac)
{
	service.update(ac);
	return "success";
}

@RequestMapping("newMember")
public String newMember(ModelMap m,int activity_id,int id) throws IOException {
	String ids=service.select(new SearchInfo("id", String.valueOf(activity_id))).get(0).getIds();
	String[] array=ids.split(",");
	for(int i=0;i<array.length;i++)
	{
		if(array[i].equals(String.valueOf(id)))
			break;
		if(i==array.length-1) {
			ids=ids+","+id;
			SearchInfo info=new SearchInfo();
			info.setWhere(" where activity_id ="+activity_id);
			activity_report r = ar_service.select(info).get(0);
			info.setWhere(" where id="+id);
			activity_user u=u_service.select(info).get(0);
			studentjson ujson=new studentjson();
			ujson.setName(u.getName());
			ujson.setId(u.getId());
			ujson.setStudentinfo("");
			ObjectMapper mapper = new ObjectMapper();
			if(!r.getStudentinfo().equals(""))
			{
				JavaType javaType = new ObjectMapper().getTypeFactory().constructParametricType(List.class, studentjson.class);
				ArrayList<studentjson> arraystudentinfo=mapper.readValue(r.getStudentinfo(), javaType);
				arraystudentinfo.add(ujson);
		        String studentinfo = mapper.writeValueAsString(arraystudentinfo);
				r.setStudentinfo(studentinfo);
			}
			else {
				ArrayList<studentjson> arraystudentinfo=new ArrayList<studentjson>();
				arraystudentinfo.add(ujson);
		        String studentinfo = mapper.writeValueAsString(arraystudentinfo);
				r.setStudentinfo(studentinfo);
			}

			ar_service.updateStudentInfo(r);
		}
	}
	activity a=new activity();
	a.setId(activity_id);
	a.setIds(ids);
	service.updateIds(a);
	SearchInfo info=new SearchInfo();
	info.setWhere(" where id in ("+ids.substring(1, ids.length())+")");
	m.put("user_added", u_service.select(info));
	m.put("user", u_service.select(new SearchInfo()));
	m.put("activity_id", activity_id);
	return "activity/memberSelected";
}

@RequestMapping("noLast")
public String noLast(ModelMap m,int activity_id)
{
	String ids=service.select(new SearchInfo("id", String.valueOf(activity_id))).get(0).getIds();
	activity a=new activity();
	a.setId(activity_id);
	a.setIds(ids.substring(0, ids.lastIndexOf(",")));
	service.updateIds(a);
	if(!ids.substring(0, ids.lastIndexOf(",")).isEmpty()) {
		SearchInfo info=new SearchInfo();
		info.setWhere(" where id in ("+ids.substring(1, ids.lastIndexOf(","))+")");
		m.put("user_added", u_service.select(info));
	}
	m.put("user", u_service.select(new SearchInfo()));
	m.put("activity_id", activity_id);
	return "activity/memberSelected";
}


}
