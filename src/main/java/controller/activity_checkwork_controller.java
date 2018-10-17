package controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import Dao_service.activity_checkwork_service;
import Dao_service.activity_service;
import Dao_service.activity_user_service;
import Dao_service.operator_service;
import Info.JsonInfo;
import Info.Json_Util;
import Info.SearchInfo;
import Info.preinform;
import entity.activity;
import entity.activity_checkwork;
import entity.operator;

@Controller
@RequestMapping("activity_checkwork")
public class activity_checkwork_controller {
@Autowired
activity_checkwork_service service;
 
@Autowired
activity_service service1;

@Autowired
operator_service service2;

@Autowired
activity_user_service service3;

@RequestMapping("index")
public void select( ModelMap map,activity_checkwork check) {

	String where="";
	if(check.getActivity_id()!=0) {
		where=" where checks.activity_id="+check.getActivity_id();
	}else if(check.getOperator_id()!=0) {
		where=" where checks.operator_id="+check.getOperator_id();
	}
	System.out.println(where);
	List<operator> op_list=service2.select(new SearchInfo("", false));
	List<activity> acti_list=service1.select(new SearchInfo("", false));
	map.put("acti_list", acti_list);
	map.put("op_list", op_list);
	
	//service.uplist(new SearchInfo(" set check1=4,check2=4,check3=4", false));
	//map.put("user", service3.select(new SearchInfo("", false)));
	map.put("list", service.selectname((new SearchInfo(where, false))));
	
}

@RequestMapping("update")
public @ResponseBody JsonInfo update(activity_checkwork checkwork,HttpSession session) {
	Integer operator_id=(Integer) session.getAttribute("operator_id");
	
	//checkwork.setActivity_id(1);
	//checkwork.setUser_id(1);
	checkwork.setOperator_id(operator_id);
	DateFormat format1=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	checkwork.setLastdate(format1.format(new Date()));
	service.update(checkwork);
	return new JsonInfo(1, "");
}

@RequestMapping("insert")
public String insert(activity_checkwork checkwork) {
	checkwork.setActivity_id(1);
	checkwork.setUser_id(1);
	checkwork.setOperator_id(2);
	DateFormat format1=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	DateFormat format2=new SimpleDateFormat("yyyy-MM-dd");
	checkwork.setDate(format2.format(new Date()));
	checkwork.setLastdate(format1.format(new Date()));
	service.insert(checkwork);;
	return "redirect:index";
}

@RequestMapping("edit")
public String edit(int id,ModelMap map) {
	map.put("info", service.selectbyID(id));
	return "activity_checkwork/add-edit";
}

@RequestMapping("change")
public String  change() {
	return "activity_checkwork/add-edit";
}

@RequestMapping("kaoqin")
public String kaoqin(SearchInfo info,HttpSession session) {
	String ids="("+info.getIds1()+")";
	//System.out.println(ids1);
	info.setIds1(ids);
	List<activity_checkwork> kaoqinlist=service.selectids(info);
	session.setAttribute("kaoqinlist", kaoqinlist);
	return "activity_checkwork/allcheck";
}

@RequestMapping("upcheck")
public @ResponseBody JsonInfo upcheck(HttpSession session,String json) {
	System.out.println(json);
//	JavaType jvt = Json_Util.mapper.getTypeFactory().constructParametricType(HashMap.class,String.class,User.class);
	HashMap<String,String> map = (HashMap<String, String>) Json_Util.jsonToObject(json, HashMap.class);
	
	activity_checkwork checkwork = (activity_checkwork) Json_Util.jsonToObject(map.get("checkwork"), activity_checkwork.class);
	preinform preinform = (Info.preinform) Json_Util.jsonToObject(map.get("pre"), preinform.class);
	String where="";
	System.out.println("check:"+checkwork.getCheck1()+":"+checkwork.getCheck2()+":"+checkwork.getCheck3()+":");
	System.out.println("pre:"+preinform.getMornning()+":"+preinform.getLunch()+":"+preinform.getNight()+":");
	
	List<activity_checkwork> uplist=(List<activity_checkwork>) session.getAttribute("kaoqinlist");
	for(activity_checkwork a:uplist) {
		if(preinform.getMornning()!=null) {
			where=" set check1="+checkwork.getCheck1()+" where id="+a.getId();
			service.uplist(new SearchInfo(where, false));
		}
		if(preinform.getLunch()!=null) {
			where=" set check2="+checkwork.getCheck2()+" where id="+a.getId();
			service.uplist(new SearchInfo(where, false));
		}
		
		if(preinform.getNight()!=null) {
			where=" set check3="+checkwork.getCheck3()+" where id="+a.getId(); 
		}
	}
	return new JsonInfo(1, "");
}

@RequestMapping("upmor")
public String  upmor() {
	System.out.println("comin");
	String where="";
	where =" set check1=0";
	service.uplist(new SearchInfo(where, false));
	return "redirect:index";
}

@RequestMapping("upnig")
public String  upnig() {
	System.out.println("comin");
	String where="";
	where =" set check3=0";
	service.uplist(new SearchInfo(where, false));
	return "redirect:index";
}

@RequestMapping("uplun")
public String  uplun() {
	System.out.println("comin");
	String where="";
	where =" set check2=0";
	service.uplist(new SearchInfo(where, false));
	return "redirect:index";
}
}
