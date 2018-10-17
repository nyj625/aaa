package controller;



import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import Dao_service.operator_service;
import Info.JsonInfo;
import Info.SearchInfo;
import entity.activity_user;
import entity.operator;

@Controller
@RequestMapping("operator")
public class operator_controller {
	@Autowired 
	operator_service service;//���ʵ��ǽӿڣ�ֻҪ����ʵ������ӿڣ����Զ���������

	@RequestMapping("index")
	public void select(ModelMap map,SearchInfo s){//���ܼ�where,��ͨentity�Զ�ע�뵽sql���ƴ�ӣ�ֻ��ͨ�����󴫽���	
		String where="";
		if(s.getInput()!=null&&s.getSelect()!=null)
		where=" where "+s.getSelect()+" like "+"'%"+s.getInput()+"%'";
//		 String limit="";
//		 int max=3;
//		 if(pageno==null||pageno<1)pageno=1;
//		 int prev=1;
//		 int next=2;
//		 limit=" limit "+(pageno-1)*max+","+max;			
//			prev=pageno>1?pageno-1:1;
//			next=  pageno+1;
//		 map.put("prev", prev);
//		 map.put("next", next);
		 //map.put("seach", s);�����ѯ״̬��������ѯ��¼��ǰҳ
		map.put("powerlist",operator.powerlist);
		map.put("statuslist", operator.statuslist);
		map.put("typelist", operator.typelist);	
		
		map.put("list", service.select(new SearchInfo(where, false)));
		
		
}

	@RequestMapping("insert")
	public   @ResponseBody JsonInfo  insert(operator o){
	service.insert(o);
	return new JsonInfo(1,"");
	}
	@RequestMapping("delete")
	public  String delete(int id){
		service.delete(id);
		return "redirect:index";
		}
	
	@RequestMapping("update")
	public   @ResponseBody JsonInfo  update( operator o){	
	
	service.update(o);
	return new JsonInfo(1,"");
	}
	
	@RequestMapping("updatepass")
	public   @ResponseBody JsonInfo  updatepass(int id){	
	operator o=service.selectbyID(id);	
	o.setPass("123");
	service.update(o);
	return new JsonInfo(1,"");
	}
	
	@RequestMapping("change")
	public String add(ModelMap map) {		
		map.put("powerlist",operator.powerlist);
		map.put("typelist", operator.typelist);
		map.put("statuslist", operator.statuslist);			
		return "operator/add-edit";//ָ����ͼ�������֣�������ָ�򷽷�
	}
	
	
	 @RequestMapping("edit")
	   public String  edit(ModelMap map,int id) {
		 	map.put("powerlist",operator.powerlist);
			map.put("typelist", operator.typelist);
			map.put("statuslist", operator.statuslist);
			operator info = service.selectbyID(id);
		 map.put("info",info);		
		 return "operator/add-edit";
		}
	 @RequestMapping("login")
		public  String login(operator o,String code,HttpSession session) {
				session.removeAttribute("error");
				System.out.println(o.getNiki());
			if(session.getAttribute("randomCode").toString().equalsIgnoreCase(code)) {
				operator op=service.login(o.getNiki());			
					if(op!=null) {		
						System.out.println(11);
								session.setAttribute("operator_id",op.getId());	
								session.setMaxInactiveInterval(36000);
								return "index";							
						}else {
							session.setAttribute("error", "�û�������");
						System.out.println(22);
							return "redirect:/login.jsp";
						}
				} else {
					System.out.println(33);
				session.setAttribute("error", "��֤�����");
				return "redirect:/login.jsp";
			}
			
			
	}
		

}