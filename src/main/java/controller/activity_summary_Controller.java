package controller;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import Dao_service.activity_service;
import Dao_service.activity_summary_service;
import Dao_service.operator_service;
import Info.JsonInfo;
import Info.SearchInfo;
import entity.activity_summary;
@Controller
@RequestMapping("activity_summary")
public class activity_summary_Controller {
	@Autowired
	activity_summary_service service;
	
	@Autowired
	activity_service tservice;
	@Autowired
	operator_service oservice;

	@RequestMapping("index")
	public String index(SearchInfo info, String txt, Integer select, ModelMap m) {
		if(txt==null) {
			txt="";
		}
	
		String where="";
		where=" where t.name like '%"+txt+"%'";
		info.setWhere(where);
		m.put("search", info);		
		m.put("list",service.select(info));	
		return "activity_summary/index";
			
	}

	@RequestMapping("insert")
	protected @ResponseBody JsonInfo insert(activity_summary s) {
	
		service.insert(s);
		
		return new JsonInfo(1, "");
	}

	@RequestMapping("update")
	public @ResponseBody JsonInfo update(activity_summary s) {

		service.update(s);
		return new JsonInfo(1, "");
	}
	@RequestMapping("dele")
	protected String dele(int id){
	 	 
		 service.delete(id);
		 return "redirect:index";
	}
	
	/*@RequestMapping("deleteall")
	protected String deleteall(String ids){
		
		 return "redirect:index";
	}
	*/
	
	@RequestMapping("add")
	protected String add(ModelMap m) {
	
	m.put("typerow",tservice.select(new SearchInfo("", false)));
	m.put("typerow1",oservice.select(new SearchInfo("", false)));
	return "activity_summary/edit";
	}
	
	@RequestMapping("edit")
	protected String edit(ModelMap m,int id) {

		m.put("info",service.getById(id));
		 return add(m);
	
}
	
}