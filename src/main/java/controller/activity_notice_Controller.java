package controller;




import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import Dao_service.activity_notice_service;
import Dao_service.activity_service;
import Dao_service.operator_service;
import Info.JsonInfo;
import Info.SearchInfo;
import entity.activity_notice;

@Controller
@RequestMapping("activity_notice")
public class activity_notice_Controller {
	@Autowired
	activity_notice_service service;
	
	@Autowired
	activity_service tservice;
	@Autowired
	operator_service oservice;

	@RequestMapping("index")
	public String index(SearchInfo info,HttpServletRequest req, String txt, Integer select, ModelMap m) {
		  
	  	  Integer id;
	  	m.put("id", req.getParameter("id"));
	  	if(req.getParameter("id")==null)
	  		
	  	 info.setWhere("where activity_id="+tservice.select(new SearchInfo()).get(0).getId());
	  
	  	if(req.getParameter("id")!=null){
	  		 id=Integer.parseInt(req.getParameter("id"));
	  		 
	  		info.setWhere("where activity_id="+id);
	  	     m.put("activity_id",id);
	  	}
	  	
	  	   m.put("slist", tservice.select(new SearchInfo()));
	  	   
	  		
	  		
	  	
	         
	  	List<activity_notice> us=(List<activity_notice>) service.select(info);

	 		m.put("result", info);

	  		m.put("list",us);
	  		
	  
			return "activity_notice/index";
				
		}
	@RequestMapping("insert")
	protected @ResponseBody JsonInfo insert(activity_notice s) {
	
		service.insert(s);
		
		return new JsonInfo(1, "");
	}

	@RequestMapping("update")
	public @ResponseBody JsonInfo update(activity_notice s) {

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
		m.put("statusstatus",  activity_notice.statusstatus);
	m.put("typerow",tservice.select(new SearchInfo()));
	m.put("typerow1",oservice.select(new SearchInfo()));
	return "activity_notice/edit";
	}
	
	@RequestMapping("edit")
	protected String edit(ModelMap m,int id) {

		m.put("info",service.getById(id));
		 return add(m);
	
}

	@RequestMapping("ind1")
	public String ind1(SearchInfo info,ModelMap m) {
		m.put("list",service.select(new SearchInfo()));
		
		return "activity_notice/index2";
}
	
}