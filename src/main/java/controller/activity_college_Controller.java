package controller;




import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import Dao_service.activity_college_service;
import Dao_service.activity_school_service;
import Info.JsonInfo;
import Info.SearchInfo;
import entity.activity_college;

@Controller
@RequestMapping("activity_college")
public class activity_college_Controller {
	@Autowired
	activity_college_service service;
	
	@Autowired
	activity_school_service sservice;
	

	@RequestMapping("index")
	public String index(SearchInfo info, String txt, String school_id, ModelMap m,Integer pageno) {
		System.out.println(school_id);
		if(txt==null) {
			txt="";
		}
	
		String where="";
		
		where=" where activity_college.name like '%"+txt+"%'";
		System.out.println(txt);
		info.setWhere(where);
		info.setPageno(pageno);
		m.put("sclist", sservice.select(info));
		m.put("list",service.select(info));	
		return "activity_college/index";
			
	}

	@RequestMapping("insert")
	protected @ResponseBody JsonInfo insert(activity_college c) {
	
		service.insert(c);
		
		return new JsonInfo(1, "");
	}

	@RequestMapping("update")
	protected @ResponseBody JsonInfo  update(activity_college c) {

		service.update(c);
		return new JsonInfo(1, "");
	}
	@RequestMapping("dele")
	protected String dele(int id){
	 	 
		 service.delete(id);
		 return "redirect:index";
	}
	
	
	@RequestMapping("add")
	protected String add(ModelMap m) {	
	m.put("typerow",sservice.select(new SearchInfo("", false)));
	return "activity_college/edit";
	}
	
	@RequestMapping("edit")
	protected String edit(ModelMap m,int id) {
		m.put("info",service.getById(id));
		 return add(m);
	
}
	@RequestMapping("ReturnData")
	@ResponseBody
	public List<activity_college> ReturnData(SearchInfo info,String s_name,ModelMap m) {
		if(info.getTxt()==null) {
			info.setTxt("");
		}
		if(info.getSearchType()==null)
		{
			info.setSearchType("''");
		}
	
		String where="";
		where=" where "+info.getSearchType()+" like '%"+info.getTxt()+"%'";
		info.setWhere(where);
		return service.select(info);			
	}
	
	
}