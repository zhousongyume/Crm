package org.java.contller;

import java.sql.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.java.entity.Cst_Customer;
import org.java.entity.Cst_Lost;
import org.java.serivce.lmpl.Cst_customerServiceImpl;
import org.java.serivce.lmpl.Cst_lostServiceImpl;
import org.java.utils.Pages;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class Cst_lostController {

	@Autowired
	private Cst_lostServiceImpl cst_lostServiceImpl;
	@Autowired
	private Cst_customerServiceImpl cst_customerServiceImpl;

	/**
	 * 找到具体流失客户信息跳转
	 */
	@RequestMapping("/toLostCustomerInfo")
	public String toCustomerInfo(HttpServletRequest request 
			,Long lst_id){
		Cst_Lost cst_lost=cst_lostServiceImpl.selectCustomerById(lst_id);
		request.setAttribute("cst_lost", cst_lost);
		return "lostcustomerassign";
	}
	
	/**
	 * 删除流失客户
	 */
	@RequestMapping("/doLostDelete")
	public String doLostDelete(HttpServletRequest request,Long lst_id){
		//开始调用业务逻辑层的删除方法
		cst_lostServiceImpl.deleteLostCustomerById(lst_id);
		//最后跳转到分页页面
		return "redirect:/toShowLost";
	}
	
	/**
	 * 在进行流失客户修改前跳转到修改页面同时将当前对象传输
	 */
	@RequestMapping("/toUpdateLost")
	public String toUpdateLost(HttpServletRequest request,Long lst_id){
		Cst_Lost cst_lost = cst_lostServiceImpl.selectCustomerById(lst_id);
		request.setAttribute("cst_lost", cst_lost);
		//最后将对象转发到修改页面
		return "uplostcustomer";
	}
	
	@RequestMapping("doUpdateLost")
	public String doUpdateLost(HttpServletRequest request,String lst_delay,String lst_reason,String lst_status,Long lst_id){
		Cst_Lost cst_lost=new Cst_Lost();
		cst_lost.setLst_delay(lst_delay);
		cst_lost.setLst_reason(lst_reason);
		cst_lost.setLst_status(lst_status);
		cst_lost.setLst_id(lst_id);
		cst_lostServiceImpl.updateLostCustomerById(cst_lost);
		//最后跳转到分页页面
		return "redirect:/toShowLost";
	}
	
	/**
	 * 跳转添加页面
	 */
	@RequestMapping("toAddLost")
	public String toAddLost(){
		return "addLost";
	}
	
	/**
	 * 添加流失客户
	 */
	@RequestMapping("doAddLost")
	public String doAddLost(HttpServletRequest request,Long lst_cust_no,String lst_cust_name,String lst_cust_manager_name,Date lst_last_order_date,Date lst_lost_date,String lst_delay,String lst_reason,
			String lst_status){
		Cst_Lost cst_lost=new Cst_Lost();
		 Cst_Customer cst_Customer= cst_customerServiceImpl.selectCstByid(lst_cust_no);
		 cst_lost.setLst_cust_no(lst_cust_no);
		cst_lost.setLst_cust_manager_id(cst_lostServiceImpl.selectLostCusManagerIdByName(lst_cust_manager_name));
		cst_lost.setLst_cust_manager_name(lst_cust_manager_name);
		cst_lost.setLst_cust_name(cst_Customer.getCust_name());
		cst_lost.setLst_delay(lst_delay);
		cst_lost.setLst_last_order_date(lst_last_order_date);
		cst_lost.setLst_lost_date(lst_lost_date);
		cst_lost.setLst_reason(lst_reason);
		cst_lost.setLst_status(lst_status);
		cst_lostServiceImpl.addLostCustomer(cst_lost);
		//最后添加完毕后页面跳转到分页
		return "redirect:showlost";
	}
	
	@RequestMapping("/toShowLost")
	public String toShowLost(HttpServletRequest request,String lst_cust_name,String lst_cust_manager_name,Long lst_status,String pageNow,String pageSize) throws Exception{
		//模糊查询加入的参数
		request.setAttribute("lst_cust_name", lst_cust_name);
		request.setAttribute("lst_cust_manager_name", lst_cust_manager_name);
		request.setAttribute("lst_status", lst_status);
		Pages<Cst_Lost> page=cst_lostServiceImpl.getPage( lst_cust_name, lst_cust_manager_name, lst_status, pageNow, pageSize);
		request.setAttribute("page", page);
		return "showlost";
	}
	 
}
