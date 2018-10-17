package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import Dao_service.activity_evaluation_service;
import Info.JsonInfo;
import Info.SearchInfo;
import entity.activity_evaluation;

@Controller
@RequestMapping("activity_evaluation")
public class activity_evaluation_controller {

	@Autowired
	activity_evaluation_service service;
	
	@RequestMapping("index")
	public void index(SearchInfo info, String txt, Integer select, ModelMap m,activity_evaluation eve) {
		if(txt==null) {
			txt="";
		}
		String where="";
		where=" where activity_evaluation.activity_id like '%"+txt+"%'";
		System.out.println(txt);
		info.setWhere(where);
		m.put("search", info);		
		m.put("list",service.select(info));	
		m.put("slist", eve.sstatus);
	
			}
	
	
	@RequestMapping("delete")
	public String delete(int id) {
		service.delete(id);
			return "redirect:index";
	}
	
	@RequestMapping("update")
	public @ResponseBody JsonInfo update(activity_evaluation u) {
		service.update(u);
		return new JsonInfo(1,"");
	}
	
	
	@RequestMapping("insert")
	public @ResponseBody JsonInfo insert(activity_evaluation u) {
		service.insert(u);
		return new JsonInfo(1,"");
	}
	
	
	@RequestMapping("add")
	public String add(ModelMap m) {
			return "Evaluation/edit";
	}
	
	@RequestMapping("edit")
	public String edit(int id,ModelMap m) {
		m.put("info", service.selectbyID(id));
		System.out.println(service.selectbyID(id).getStatus());
		return add(m);
	}	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
