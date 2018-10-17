package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import Dao_service.activity_usergroup_service;
import Info.JsonInfo;
import Info.SearchInfo;
import entity.activity_usergroup;

@Controller
@RequestMapping("activity_usergroup")
public class activity_usergroup_controller {
	@Autowired
	activity_usergroup_service service;
	
@RequestMapping("index")
public void select(ModelMap map,SearchInfo info) {
	String where="";
	if(info.getInput()!=null&&info.getSelect()!=null)
	where=" where " +info.getSelect()+ " like "+ "'%"+info.getInput()+"%'";
	map.put("list", service.select(new SearchInfo(where, false)));
	
}
@RequestMapping("insert")
public @ResponseBody JsonInfo insert(activity_usergroup user) {
	user.setActivity_id(1);
	user.setOperator_id(2);
	user.setPath("cndfjj");
	service.insert(user);
	return new JsonInfo(1, "");
}

@RequestMapping("delete")
public String delete(int id) {
	service.delete(id);
	return "redirect:index";
}

@RequestMapping("select")
public activity_usergroup selectbyId(int id) {
	
	return service.selectbyId(id);
}

@RequestMapping("update")
public @ResponseBody JsonInfo update(activity_usergroup user) {
	user.setActivity_id(1);
	user.setOperator_id(2);
	user.setPath("cndfjj");
	service.upadate(user);
	return new JsonInfo(1, "");
}
@RequestMapping("edit")
public String edit(int id,ModelMap map) {
map.put("info", service.selectbyId(id));
	return "activity_usergroup/add-edit";
}

@RequestMapping("change")
public String add() {
	return "activity_usergroup/add-edit";
}
}
