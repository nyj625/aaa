package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import Dao_service.activity_school_service;
import Info.JsonInfo;
import Info.SearchInfo;
import entity.activity_school;


@Controller
@RequestMapping("School")
public class activity_school_controller {
	
	@Autowired	
	activity_school_service service;
	
	
	@RequestMapping("index")
	public String index(SearchInfo info, String txt, Integer select, ModelMap m) {
		if(txt==null) {
			txt="";
		}
	
		String where="";
		where=" where activity_school.name like '%"+txt+"%'";
		System.out.println(txt);
		info.setWhere(where);
		m.put("search", info);		
		m.put("list",service.select(info));	
		return "School/index";
			
	}
	
	
	
				
			@RequestMapping("delete")
			public String delete(int id) {
				service.delete(id);
					return "redirect:index";
			}
			
			@RequestMapping("update")
			public @ResponseBody JsonInfo update(activity_school s) {
				service.update(s);
				return new JsonInfo(1,"");
			}
			
			
			@RequestMapping("insert")
			public @ResponseBody JsonInfo insert(activity_school s) {
				service.insert(s);
				return new JsonInfo(1,"");
			}
			
			
			@RequestMapping("add")
			public String add(ModelMap m) {
					return "School/add-edit";
			}
			
			@RequestMapping("edit")
			public String edit(int id,ModelMap m) {
				m.put("info", service.getById(id));
				return add(m);
			}	
			
			
			
}
