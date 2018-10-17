package controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import Dao_service.activity_college_service;
import Dao_service.activity_school_service;
import Dao_service.activity_user_service;
import Info.SearchInfo;
import entity.activity_college;
import entity.activity_school;
import entity.activity_user;

@Controller
@RequestMapping("activity_user")
public class activity_userController {

	@Autowired
	activity_user_service service;
	
	@Autowired
	activity_school_service s_service;
	
	@Autowired
	activity_college_service c_service;
	
	@RequestMapping("index")
	public void select(ModelMap m,String searchType,String txt,String way,SearchInfo s,Integer pageno)
	{	
	
		String where="";		
		if(txt==null) txt="";
		if(way==null) way="";
		if(searchType==null) searchType="";
		if(way!=null&&searchType!=null) {
			if(way.equals("school")) {
				where=" where school_id="+searchType;									
			}
			if(way.equals("college")) {
				where=" where college_id="+searchType;
			
			}
			if(way.equals("people")){
				where=" where type="+searchType+" and name like '%"+txt+"%'";			
			}
		
		}
		m.put("prev", s.getPrev());
		m.put("next", s.getNext());
		s.setPageno(pageno);
		s.setWhere(where);
		
		List<activity_user> list=service.select(s);
		
		m.put("user", list);
		List<activity_user> list1=service.select(new SearchInfo("", false));
		String sid="";
		String cid="";
		for(int i=0;i<list1.size();i++)
		{
			sid=sid+list1.get(i).getSchool_id()+",";
			cid=cid+list1.get(i).getCollege_id()+",";
		}
		
		if(sid.length()>1) {
			where=" where id in ("+sid.substring(0,sid.length()-1)+")";
			List<activity_school> sList=s_service.select(new SearchInfo(where, false));
			m.put("school", sList);
		}
		
		if(cid.length()>1) {
			where=" where c.id in ("+cid.substring(0,cid.length()-1)+")";
			List<activity_college> cList=c_service.select(new SearchInfo(where, false));
			m.put("college", cList);
		}
		
		
		
		
		
	}
	
	@RequestMapping("insert")
	public @ResponseBody String insert(activity_user user)
	{	
		user.setPass("123");
		SimpleDateFormat fmt=new SimpleDateFormat("yyyy-MM-dd");
		user.setCreatedate(fmt.format(new Date()));
		user.setOperator_id(1);
		service.insert(user);
		return "success";
	}
		
	@RequestMapping("del")
	public String del(int id)
	{
		
		service.delete(id);
		return "redirect:index";
	}
	
	@RequestMapping("add")
	public String add(ModelMap m)
	{
		m.put("school", s_service.select(new SearchInfo("",false)));
		return "activity_user/edit";
	}
	
	@RequestMapping("edit")
	public String edit(ModelMap m,int id)
	{	
		activity_user user=service.selectbyID(id);
		m.put("user", user);
		List<activity_school> school=s_service.select(new SearchInfo("",false));
		m.put("school",school);
		SearchInfo searchInfo=new SearchInfo();
		searchInfo.setWhere(" where school_id ="+user.getSchool_id());
		m.put("college", c_service.select(searchInfo));
		return "activity_user/edit";
	}
	
	@RequestMapping("update")
	public @ResponseBody String update(activity_user user)
	{
		service.update(user);
		return "success";
	}
	
	@RequestMapping("newGroup")
	public String newGroup(String searchType,String txt,ModelMap m)
	{
		String name="";
		SearchInfo where=new SearchInfo();
		where.setWhere(" where id in ("+txt+")");
		List<activity_user> users=service.select(where);
		System.out.println("size"+users.size());
		for(int i=0;i<users.size();i++)
		{
			name=name+users.get(i).getName()+",";
		}
		m.put("ids", txt);
		m.put("names", name.substring(0,name.length()-1));
		return "activity_user/add-edit";
	}
	
	@RequestMapping("login")
    public  String login(activity_user u,String code,HttpSession session) {
       
               session.removeAttribute("error");
         if(session.getAttribute("randomCode").toString().equalsIgnoreCase(code)) {
               activity_user user=service.login(u);
               
                    if(user!=null) {
                                   
                                    session.setAttribute("user", user);
                                     
                                    return "index";
                               
                         }else {
                              session.setAttribute("error", "用户名错误");
                               return "redirect:/login.jsp";
                         }
               } else {
               session.setAttribute("error", "验证码错误");
               return "redirect:/login.jsp";
         }
         
         
}
}
