package org.java.contller;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.java.dao.Sal_PlanDao;
import org.java.entity.Sal_Chance;
import org.java.entity.Sal_Plan;
import org.java.entity.Sys_User;
import org.java.serivce.lmpl.Sal_ChanceServiceimpl;
import org.java.serivce.lmpl.Sal_PlanServiceimpl;
import org.java.serivce.lmpl.Sys_UserServicelmpl;
import org.java.utils.Pages;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.condition.RequestMethodsRequestCondition;

import com.alibaba.fastjson.JSON;

@Controller
public class PlanColltller {
	@Autowired
		private Sal_PlanServiceimpl sal_PlanServiceimpl;
		

		public Sal_PlanServiceimpl getSal_PlanServiceimpl() {
			return sal_PlanServiceimpl;
		}
		public void setSal_PlanServiceimpl(Sal_PlanServiceimpl sal_PlanServiceimpl) {
			this.sal_PlanServiceimpl = sal_PlanServiceimpl;
		}
		/**
		 * 模糊查询
		 * @return
		 */
		@RequestMapping("/planShow")
		public String select(String pageNow, String pageSize,String chc_cust_name,String chc_title,String chc_linkman, HttpServletRequest req){
				Pages<Sal_Chance> Sal_Chance_pages=sal_PlanServiceimpl.Sal_ChancePage(pageNow, pageSize, chc_cust_name, chc_title, chc_linkman);
				  req.setAttribute("Sal_Chance_pages",Sal_Chance_pages);
			        req.setAttribute("chc_cust_name",chc_cust_name);
			        req.setAttribute("chc_title",chc_title);
			        req.setAttribute("chc_linkman",chc_linkman);

		return "plan";
		}
		@RequestMapping("/getjson")
		public String getJson(Long id,String pageNum){
			Sal_Chance sal_Chance=new Sal_Chance();
			sal_Chance.setChc_id(id);
			sal_Chance.setChc_status(2);
			sal_PlanServiceimpl.updateStatus(sal_Chance);
			return "redirect:planShow";
		}
		
		
		@RequestMapping("/SelectSal_PlanById")
		public String Sal_ChanceById(Model model,int chc_id,int pla_chc_id){
			Sal_Chance chance = sal_PlanServiceimpl.selectUserNameByid(chc_id);
			model.addAttribute("chance", chance);
			List<Sal_Plan> list=sal_PlanServiceimpl.Sal_Plan_SelectByid(pla_chc_id);
			model.addAttribute("list", list);
			return "planformulate";
		}
	
		@RequestMapping("/addSal_Plan")
		public String addSal_Plan(int pla_chc_id,String pla_date,String pla_todo,int chc_id) throws ParseException{
			Sal_Plan sal_Plan=new Sal_Plan();
			Long id=(long) pla_chc_id;
			sal_Plan.setPla_chc_id(id);
			
			SimpleDateFormat sf=new SimpleDateFormat("yyyy年MM月dd");
			sal_Plan.setPla_date(sf.parse(pla_date));
			sal_Plan.setPla_todo(pla_todo);
			sal_PlanServiceimpl.Sal_Plan_Insert(sal_Plan);
			
			return "forward:SelectSal_PlanById?chc_id="+chc_id+"&pla_chc_id="+pla_chc_id;
		}
		
		@RequestMapping("/updateSal_Plan")
		public String updateSal_Plan(Sal_Plan sal_Plan){
			sal_PlanServiceimpl.Update_Sal_Plan(sal_Plan);
			return null;
		}
	
		@RequestMapping("/deleteSal_Plan")
		public String deleteSal_Plan(int id){
			sal_PlanServiceimpl.Sal_Plan_Delete(id);
			return null;
		}
		
		@RequestMapping("/SelectSal_Plan")
		public String SelectSal_Plan(Model model,int chc_id,int pla_chc_id){
			Sal_Chance chance = sal_PlanServiceimpl.selectUserNameByid(chc_id);
			model.addAttribute("chance", chance);
			List<Sal_Plan> list=sal_PlanServiceimpl.Sal_Plan_SelectByid(pla_chc_id);
			model.addAttribute("list", list);
			return "planlookup";
		}
	
		@RequestMapping("/SelectSal_PlanBy")
		public String SelectSal_PlanBy(Model model,int chc_id,int pla_chc_id){
			Sal_Chance chance = sal_PlanServiceimpl.selectUserNameByid(chc_id);
			model.addAttribute("chance", chance);
			List<Sal_Plan> list=sal_PlanServiceimpl.Sal_Plan_SelectByid(pla_chc_id);
			model.addAttribute("list", list);
			return "planexecute";
		}
	
		@RequestMapping("/ZDplan")
		public String ZDplan(int chc_id,int pla_chc_id){
			return "forward:SelectSal_PlanById?chc_id="+chc_id+"&pla_chc_id="+pla_chc_id;
		}
		
		@RequestMapping("/ZDplanXui")
		public String ZDplanXui(Sal_Plan sal_Plan){
			sal_PlanServiceimpl.Update_Sal_Plan(sal_Plan);
			return "true";
		}
		
		@RequestMapping("/ZDplanCheng")
		public String ZDplanCheng(int chc_id){
			Sal_Chance sal_Chance=new Sal_Chance();
			Long id=(long) chc_id;
			sal_Chance.setChc_id(id);
			sal_Chance.setChc_status(2);
			sal_PlanServiceimpl.updateStatus(sal_Chance);
			return "redirect:planShow";
		}
		
		
		@RequestMapping("/ZDplanShi")
		public String ZDplanShi(int chc_id){
			Sal_Chance sal_Chance=new Sal_Chance();
			Long id=(long) chc_id;
			sal_Chance.setChc_id(id);
			sal_Chance.setChc_status(3);
			sal_PlanServiceimpl.updateStatus(sal_Chance);
			return "redirect:planShow";
		}

		

}
