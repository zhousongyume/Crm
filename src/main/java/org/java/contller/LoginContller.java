package org.java.contller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.java.entity.Sys_User;
import org.java.serivce.lmpl.Sys_UserServicelmpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.condition.RequestMethodsRequestCondition;

@Controller
public class LoginContller {
	@Autowired
	private Sys_UserServicelmpl sys_UserServicelmpl;
	
	public Sys_UserServicelmpl getSys_UserServicelmpl() {
		return sys_UserServicelmpl;
	}

	public void setSys_UserServicelmpl(Sys_UserServicelmpl sys_UserServicelmpl) {
		this.sys_UserServicelmpl = sys_UserServicelmpl;
	}
	@RequestMapping("/login")
	public String show(Model model){
		
		return "Login";
	}
	
	@RequestMapping("/signin")
	public String Login( Model model,String loginname,String password,HttpServletRequest request){
		Sys_User sys_user = new Sys_User();
		sys_user.setUser_name(loginname);
		sys_user.setUser_password(password);
		Sys_User user = sys_UserServicelmpl.Sys_User_Select(sys_user);
		if (user!=null) {
			HttpSession session=request.getSession();
			session.setAttribute("user", user);
			return "index";
		}
		return "forward:login";
	}
}
	