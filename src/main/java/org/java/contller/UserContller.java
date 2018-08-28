package org.java.contller;
import javax.servlet.http.HttpServletRequest;
import org.java.entity.Sys_User;
import org.java.serivce.lmpl.Sys_UserServicelmpl;
import org.java.utils.Pages;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UserContller {
	@Autowired
	private Sys_UserServicelmpl sys_UserServicelmpl;
	
	public Sys_UserServicelmpl getSys_UserServicelmpl() {
		return sys_UserServicelmpl;
	}

	public void setSys_UserServicelmpl(Sys_UserServicelmpl sys_UserServicelmpl) {
		this.sys_UserServicelmpl = sys_UserServicelmpl;
	}
	@RequestMapping("/userSelectTo")
	public String selectTo(String pageNow, String pageSize, String user_name,String user_role_id, HttpServletRequest req){
		if("0".equals(user_role_id)||user_role_id==null){
			user_role_id="";
		}
		Pages<Sys_User> Sys_User_pages=sys_UserServicelmpl.Sys_UserPage(pageNow, pageSize, user_name, user_role_id);
		  req.setAttribute("Sys_User_pages",Sys_User_pages);
	        req.setAttribute("user_name",user_name);
	        req.setAttribute("user_role_id",user_role_id);
		return "users";
	}

	@RequestMapping("/useradd")
	public String show(Model model){
		
		return "userinsert";
	}
	@RequestMapping("update")
	public String selectid(Model model,Long user_id){
		Sys_User sys_user=sys_UserServicelmpl.Sys_User_SelectById(user_id);
		model.addAttribute("user", sys_user); 
		return "userassign";
	}
	@RequestMapping("/userinsert")
	public String insert(String user_name,String user_password,long user_role_id,Integer user_flag){
		Sys_User sys_user = new Sys_User();
		sys_user.setUser_name(user_name);
		sys_user.setUser_password(user_password);
		sys_user.setUser_role_id(user_role_id);
		sys_user.setUser_flag(user_flag);
		 sys_UserServicelmpl.Sys_User_Insert(sys_user);
		return "redirect:userSelectTo";
	}
	
	@RequestMapping("/userdelete")
	public String delete(long user_id){
		Sys_User sys_user = new Sys_User();
		sys_user.setUser_id(user_id);
		 sys_UserServicelmpl.Sys_User_Delete(user_id);
		return "redirect:userSelectTo";
	}
	
	@RequestMapping("/SysUserUpdate")
	public String update(long user_id,long user_role_id){
		Sys_User sys_user = new Sys_User();
		sys_user.setUser_id(user_id);
		sys_user.setUser_role_id(user_role_id);
		 sys_UserServicelmpl.Sys_User_Update(sys_user);
		return "redirect:userSelectTo";
	}
	
}
