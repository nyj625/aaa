package controller;



import java.io.IOException;
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

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import Dao_service.activity_market_service;
import Dao_service.activity_service;
import Dao_service.activity_user_service;
import Info.JsonInfo;
import Info.Json_Util;
import Info.SearchInfo;
import Info.json;
import entity.activity_market;
import entity.activity_user;

@Controller
@RequestMapping("activity_market")
public class activity_market_Controller {
	@Autowired
	activity_market_service service;
	
	@Autowired
	activity_service service1;
	
	@Autowired
	activity_user_service service2;
	
	
	@RequestMapping("index")
	public String index( ModelMap m,Integer activity_id) {
		String where="";
		if(activity_id!=null)	
		where=" where activity_id = "+activity_id;
		m.put("activity", service1.select(new SearchInfo("", false)));
		m.put("list",service.select(new SearchInfo(where, false)));
		return "activity_market/index";
			
	}

	@RequestMapping("insert")
	public @ResponseBody JsonInfo insert(activity_market c) {
		c.setOperator_id(1);
		//System.out.println(c.getStudentjson());
		String studentjson=c.getStudentjson();
		json[] json=(Info.json[]) Json_Util.jsonToObject(studentjson, json[].class);
		for(int i=0;i<json.length;i++) {
			if(json[i].getId()==-1){
				activity_user user=new activity_user("", "", json[i].getName(), 0, 0, "", "", "", 0, 0, 0, 0, 0, 0, "", "", 0, "");
				service2.insert(user);
				int id=service2.selectmax();
				json[i].setId(id);
			
			}
		}
		String studentjsons=Json_Util.toJsonString(json);
		c.setStudentjson(studentjsons);
		DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		c.setDate(format.format(new Date()));
		service.insert(c);
		
		return new JsonInfo(1, "");
	}

	@RequestMapping("update")
	public @ResponseBody JsonInfo  update(activity_market c,HttpSession session) {
		Integer id=(Integer) session.getAttribute("operator_id");
		c.setOperator_id(id);
		DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		c.setDate(format.format(new Date()));
		service.update(c);
		return new JsonInfo(1, "");
	}
	@RequestMapping("delete")
	public String delete(int id){
	 	 
		 service.delete(id);
		 return "redirect:index";
	}
	
	
	@RequestMapping("change")
	public String add(ModelMap m) {	
		m.put("activity", service1.select(new SearchInfo("", false)));
	return "activity_market/add";
	}
	
	@RequestMapping("edit")
	public String edit(ModelMap m,int id) {
		m.put("activity", service1.select(new SearchInfo("", false)));
		m.put("info",service.selectbyID(id));
		 return "activity_market/edit";
	
}
	@RequestMapping("student")
	public @ResponseBody JsonInfo studentup(String studentjson,HttpSession session,activity_market c) {
		System.out.println(studentjson);
		Integer id= (Integer) session.getAttribute("id");
		c.setId(id);
		service.studentup(c);
		return new JsonInfo(1, "");
	}
	
	@RequestMapping("infomation")
	@ResponseBody
	public HashMap<String,Object> getBack(HttpSession session) throws JsonParseException, JsonMappingException, IOException{
		ObjectMapper mapper = new ObjectMapper();
		Integer id= (Integer) session.getAttribute("id");
		
		json[] stuInfo=mapper.readValue(service.selectbyID(id).getStudentjson(), json[].class);
		System.out.println(stuInfo[0].getStudentinfo());
		HashMap<String, Object> info=new HashMap<String, Object>();
		info.put("code", 0);
		info.put("msg", "");
		info.put("count", 1);
		info.put("data", stuInfo);
	
		return info;
	}
	
	@RequestMapping("information")
	public String getBack(Integer id,ModelMap map,HttpSession session){
	
		session.setAttribute("id", id);
		return "activity_market/check";
	}
	
	@RequestMapping("addstudent")
	public String addinfo(ModelMap map) {
		
		List<activity_user> username=service2.select(new SearchInfo("", false));
		for(activity_user m:username) {
			System.out.println("name"+m.getId());
		}
		map.put("username", username);
		return "activity_market/addinfo";
	}
}