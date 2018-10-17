package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import Dao_service.activity_feedback_service;
import Info.JsonInfo;
import Info.SearchInfo;
import entity.activity_feedback;


@Controller
@RequestMapping("Feedback")
public class activity_feedback_controller {
	
	@Autowired
	activity_feedback_service service;
	
	@RequestMapping("index")
	public String index(SearchInfo info, String txt, Integer select, ModelMap m,activity_feedback a) {
		if(txt==null) {
			txt="";
		}
		String where="";
		where=" where activity_feedback.activity_id like '%"+txt+"%'";
		System.out.println(txt);
		info.setWhere(where);
		m.put("search", info);		
		m.put("list",service.select(info));	
		//m.put("lists", a.sstatus);
		return "Feedback/index";
			}
	
		
	@RequestMapping("delete")
	public String delete(int id) {
		service.delete(id);
			return "redirect:index";
	}
	

	@RequestMapping("update")
	public @ResponseBody JsonInfo update(activity_feedback s) {
		if(s.getStatus()==0){
			activity_feedback a=service.selectbyID(s.getId());
			s.setStatus(a.getStatus());
		}
		
		
		service.update(s);
		return new JsonInfo(1,"");
	}
	
	
	@RequestMapping("insert")
	public @ResponseBody JsonInfo insert(activity_feedback s) {
		System.out.println(s.getOpt1());
		service.insert(s);
		return new JsonInfo(1,"");
	}
	
	
	@RequestMapping("add")
	public String add(ModelMap m) {
			return "Feedback/edit";
	}
	
	@RequestMapping("edit")
	public String edit(int id,ModelMap m) {
		m.put("info", service.selectbyID(id));
		return add(m);
	}	
	
	@RequestMapping("opt")
	public String opt(int id,ModelMap m) {
		m.put("info", service.selectbyID(id));
					return "Feedback/opt";
	}
	
	
	@RequestMapping("updateo")
	public @ResponseBody JsonInfo updateo(activity_feedback s) {
		s.setStatus(1);
		service.updateo(s);
		return new JsonInfo(1,"");
	}
	
	
	
}
