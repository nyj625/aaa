package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import Dao_service.activity_report_service;
import Info.JsonInfo;
import Info.SearchInfo;
import Info.studentjson;
import entity.activity_report;


@Controller
@RequestMapping("Report")

public class activity_report_controller {

	@Autowired
	activity_report_service service;
	
	@RequestMapping("index")
	public String index(SearchInfo info, String txt, Integer select, ModelMap m) {
		if(txt==null) {
			txt="";
		}
		String where="";
		where=" where activity_report.activity_id like '%"+txt+"%'";
		System.out.println(txt);
		info.setWhere(where);
		m.put("search", info);		
		m.put("list",service.select(info));	
		return "Report/index";
			
	}
	
		
	@RequestMapping("delete")
	public String delete(int id) {
		service.delete(id);
			return "redirect:index";
	}
	
	@RequestMapping("update")
	public @ResponseBody JsonInfo update(activity_report s) {
		service.update(s);
		return new JsonInfo(1,"");
	}
	
	
	@RequestMapping("insert")
	public @ResponseBody JsonInfo insert(activity_report s) {
		System.out.println(s.getStudentinfo());
		service.insert(s);
		return new JsonInfo(1,"");
	}
	
	
	@RequestMapping("add")
	public String add(ModelMap m) {
			return "School/edit";
	}
	
	@RequestMapping("edit")
	public String edit(int time_id,ModelMap m) throws JsonParseException, JsonMappingException, IOException {
		System.out.println("edit in");
		SearchInfo info=new SearchInfo();
		info.setWhere(" where time_id = "+time_id);
		activity_report report=service.select(info).get(0);
		m.put("info", report);
		
		ObjectMapper mapper = new ObjectMapper();
		JavaType javaType = new ObjectMapper().getTypeFactory().constructParametricType(List.class, studentjson.class);
		ArrayList<studentjson> arraystudentinfo=mapper.readValue(report.getStudentinfo(), javaType);
		m.put("studentinfo", arraystudentinfo);
		return "Report/edit";
	}	
}
