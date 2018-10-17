package controller;




import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import Dao_service.activity_checkwork_service;
import Dao_service.activity_service;
import Dao_service.activity_time_service;
import Dao_service.operator_service;
import Info.JsonInfo;
import Info.SearchInfo;
import Info.activityTimeInfo;
import entity.activity;
import entity.activity_checkwork;
import entity.activity_time;
import entity.operator;

@Controller
@RequestMapping("activity_time")
public class activity_time_Controller {
	@Autowired
	activity_time_service service;
	
	@Autowired
	operator_service oservice;
	
	@Autowired
	activity_service aservice;
	
	@Autowired
	activity_checkwork_service acservice;
	


	@RequestMapping("index")
	public String index(SearchInfo info, ModelMap m) {
		info.setWhere(" where t.id="+info.getTxt());
		if(service.select(info).size()!=0)
		{
			m.put("schedule",service.select(info));
			SearchInfo infoA=new SearchInfo();
			infoA.setWhere(" where id ="+info.getTxt());
			m.put("activity", aservice.select(infoA).get(0));
		}
		else
		{
			SearchInfo infoA=new SearchInfo();
			infoA.setWhere(" where id ="+info.getTxt());
			m.put("activity", aservice.select(infoA).get(0));
		}
		return "activity_time/index";
			
	}

	@RequestMapping("insert")
	protected @ResponseBody JsonInfo insert(String jsonSendBack,int activity_id,HttpSession session) throws JsonParseException, JsonMappingException, IOException {

		
		ObjectMapper objectMapper = new ObjectMapper();
		activityTimeInfo[] info = objectMapper.readValue(jsonSendBack, activityTimeInfo[].class);
		for(int i=0;i<info.length;i++)
		{
			String times[]=info[i].getTimes().split(",");
			activity_time time=new activity_time();
			String date=info[i].getDate();
			time.setDate(date);
			time.setRoominfo(info[i].getRoominfo());
			time.setTime1(times[0].split("-")[0]);
			time.setTime2(times[0].split("-")[1]);
			time.setTime3(times[1].split("-")[0]);
			time.setTime4(times[1].split("-")[1]);
			time.setTime5(times[2].split("-")[0]);
			time.setTime6(times[2].split("-")[1]);
			time.setComments(info[i].getComments());
			time.setStatus(1);
			time.setActivity_id(activity_id);
			Integer operator_id=(Integer) session.getAttribute("operator_id");
			time.setOperator_id(operator_id);
			service.insert(time);			
			activity a=aservice.selectbyID(activity_id);
			String[] users=a.getIds().substring(1).split(",");
			
			for(int j=0;j<users.length;j++)
			{
				activity_checkwork checkwork=new activity_checkwork();
				checkwork.setActivity_id(activity_id);				
				checkwork.setUser_id(Integer.valueOf(users[j]));
				checkwork.setDate(date);
				checkwork.setCheck1(4);
				checkwork.setCheck2(4);
				checkwork.setCheck3(4);
				checkwork.setOperator_id(operator_id);
				checkwork.setTime_id(service.getMaxId());
				checkwork.setLastdate(date);
				checkwork.setComments("");
				acservice.insert(checkwork);
			}
			
		}
		return new JsonInfo(1, "");
	}

	@RequestMapping("update")
	protected @ResponseBody JsonInfo update(activity_time t) {

		service.update(t);
		return new JsonInfo(1, "");
	}
	@RequestMapping("dele")
	protected String dele(int id){
	 	 
		 service.delete(id);
		 return "redirect:index";
	}
	
	@RequestMapping("add")
	protected String add(ModelMap m,int activity_id) {
		m.put("activity_id", activity_id);
	return "activity_time/edit";
	}
	

	

	
}