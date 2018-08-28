package org.java.contller;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.java.entity.Sal_Chance;
import org.java.entity.Sys_User;
import org.java.serivce.lmpl.Sal_ChanceServiceimpl;
import org.java.serivce.lmpl.Sys_UserServicelmpl;
import org.java.utils.Pages;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.alibaba.fastjson.JSON;

@Controller
public class ChanceContller {
	@Autowired
	private Sal_ChanceServiceimpl sal_ChanceServiceimpl;
	@Autowired
	private Sys_UserServicelmpl sys_UserServicelmpl;
	
	
	public Sal_ChanceServiceimpl getSal_ChanceServiceimpl() {
		return sal_ChanceServiceimpl;
	}
	public void setSal_ChanceServiceimpl(Sal_ChanceServiceimpl sal_ChanceServiceimpl) {
		this.sal_ChanceServiceimpl = sal_ChanceServiceimpl;
	}
	@RequestMapping("/chanceShow")
		public String select(String pageNow, String pageSize,String chc_cust_name,String chc_title,String chc_linkman, HttpServletRequest req){
				Pages<Sal_Chance> Sal_Chance_pages=sal_ChanceServiceimpl.Sal_ChancePage(pageNow, pageSize, chc_cust_name, chc_title, chc_linkman);
				  req.setAttribute("Sal_Chance_pages",Sal_Chance_pages);
			        req.setAttribute("chc_cust_name",chc_cust_name);
			        req.setAttribute("chc_title",chc_title);
			        req.setAttribute("chc_linkman",chc_linkman);

		return "chance";
	}
	@RequestMapping("/chancemanageadd")
	public String insert(){
		return "chancemanage";
	}
	@RequestMapping("/chancemanageinsert")
	public String chancemanageinsert(String chc_source,String chc_cust_name,String chc_title,Integer chc_rate,String chc_linkman,
			String chc_tel,String chc_desc, Long chc_create_id,String chc_create_by,String chc_create_date,
			Long chc_due_id,String chc_due_to,String chc_due_date,int chc_status) throws ParseException{
		Sal_Chance chance = new Sal_Chance();
		Sys_User user = sys_UserServicelmpl.selectUserid(chc_due_id);
		chance.setChc_source(chc_source);
		chance.setChc_cust_name(chc_cust_name);
		chance.setChc_title(chc_title);
		chance.setChc_rate(chc_rate);
		chance.setChc_linkman(chc_linkman);
		chance.setChc_tel(chc_tel);
		chance.setChc_desc(chc_desc);
		chance.setChc_create_id(chc_create_id);
		chance.setChc_create_by(chc_create_by);
		  SimpleDateFormat s=new SimpleDateFormat("yyyy-MM-dd");
		  chance.setChc_create_date(s.parse(chc_create_date));
		  chance.setChc_due_id(chc_due_id);
		  chance.setChc_due_to(user.getUser_name());
		  chance.setChc_due_date(s.parse(chc_due_date));

		chance.setChc_status(chc_status);
		sal_ChanceServiceimpl.Sal_Chance_Insert(chance);
		return "redirect:chanceShow";
	}
	@RequestMapping("/chanceAssign")
	public String planformulate(Model mo,Long id){
			Sal_Chance sal_Chance=sal_ChanceServiceimpl.selectUserNameByid(id);
			String chaxun="select";
			mo.addAttribute("sal_chance",sal_Chance );
			mo.addAttribute("chaxun",chaxun);
		return "chanceassign";
	}
	@RequestMapping("upChanceAssign")
	public String upChanceAssign(Model mo,Long id){
			Sal_Chance sal_Chance=sal_ChanceServiceimpl.selectUserNameByid(id);
			String chaxun="update";
			mo.addAttribute("sal_chance",sal_Chance );
			mo.addAttribute("chaxun",chaxun);
		return "chanceassign";
	}
	@RequestMapping("planupdatess")
	public String update(Model mo,Long id,Long chc_due_id,String chc_due_to,Date chc_due_date){
		Sys_User user = sys_UserServicelmpl.selectUserid(chc_due_id);
		Sal_Chance chance = new Sal_Chance();
		chance.setChc_id(id);
	 chance.setChc_due_to(user.getUser_name());
	 chance.setChc_due_date(chc_due_date);
	 sal_ChanceServiceimpl.Sal_chance_Update(chance);
		return "redirect:chanceShow";
	}
	
	
	@RequestMapping(value="/selectUserName",method=RequestMethod.POST,produces= {"application/json;charset=UTF-8"})
	@ResponseBody
	public Object selUserName(){
		List<Sys_User> user=sal_ChanceServiceimpl.SelectUserName();
	return JSON.toJSONString(user);
}
	@RequestMapping("/deleteChance")
	public String delete(Model mo,Long id){
		sal_ChanceServiceimpl.Sal_chance_Delete(id);
		return "redirect:chanceShow";
	}
}
