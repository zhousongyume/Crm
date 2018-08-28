package org.java.contller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.java.dao.Sys_UserDao;
import org.java.entity.Cst_Customer;
import org.java.entity.Sal_Chance;
import org.java.entity.Sys_User;
import org.java.serivce.lmpl.Cst_customerServiceImpl;
import org.java.serivce.lmpl.Sal_ChanceServiceimpl;
import org.java.serivce.lmpl.Sys_UserServicelmpl;
import org.java.utils.Pages;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;


/**
 * 客户管理模块控制层
 */
@Controller
public class Cst_customerController {

	@Autowired
	private Cst_customerServiceImpl cst_customerServiceImpl;
	@Autowired
	private Sys_UserServicelmpl sys_UserServicelmpl;
	
	/**
	 * 找到具体客户信息跳转
	 */
	@RequestMapping("/toCustomerInfo")
	public String toCustomerInfo(HttpServletRequest request, Long cust_no) {
		Cst_Customer cst_customer = cst_customerServiceImpl.selectCustomerById(cust_no);
		request.setAttribute("cst_customer", cst_customer);
		return "customerassign";
	}

	/**
	 * 删除客户
	 */
	@RequestMapping("/doDelete")
	public String doDelet(HttpServletRequest request, Long cust_no) {
		cst_customerServiceImpl.deleteCustomerById(cust_no);
		return "redirect:/toCustomer";
	}

	/**
	 * 跳转修改
	 */
	@RequestMapping("/toUpdateCst")
	public String toUpdateCst(HttpServletRequest request, Long cust_no) {
		Cst_Customer cst_customer = cst_customerServiceImpl.selectCustomerById(cust_no);
		request.setAttribute("cst_customer", cst_customer);
		// 跳转前得到具体对象
		return "updatecustomer";
	}

	/**
	 * 进行修改
	 * @Description TODO
	 */
	@RequestMapping("/doUpdateCst")
	public String doUpdateCst(HttpServletRequest request, String cust_name, String cust_region, String cust_level_label,
			int cust_satisfy, int cust_credit, String cust_addr, String cust_zip, String cust_tel, String cust_fax,
			String cust_website, String cust_licence_no, String cust_chieftain, Long cust_no,String cust_status, Long cust_manager_id,
			String cust_manager_name) {
		Cst_Customer cst_customer = new Cst_Customer();
		cst_customer.setCust_status(cust_status);
		cst_customer.setCust_name(cust_name);
		cst_customer.setCust_level_label(cust_level_label);
		cst_customer.setCust_region(cust_region);
		switch (cust_level_label) {
		case "I":
			cst_customer.setCust_level(1);
			break;
		case "II":
			cst_customer.setCust_level(2);
			break;
		case "III":
			cst_customer.setCust_level(3);
			break;
		case "VI":
			cst_customer.setCust_level(4);
			break;
		case "V":
			cst_customer.setCust_level(5);
			break;
		}
		cst_customer.setCust_satisfy(cust_satisfy);
		cst_customer.setCust_credit(cust_credit);
		cst_customer.setCust_addr(cust_addr);
		cst_customer.setCust_zip(cust_zip);
		cst_customer.setCust_tel(cust_tel);
		cst_customer.setCust_fax(cust_fax);
		cst_customer.setCust_website(cust_website);
		cst_customer.setCust_licence_no(cust_licence_no);
		cst_customer.setCust_chieftain(cust_chieftain);
		cst_customer.setCust_no(cust_no);
		cst_customer.setCust_manager_id(cust_manager_id);
		cst_customer.setCust_manager_name(cust_manager_name);
		cst_customerServiceImpl.updateCst(cst_customer);
		// 修改完跳转分页
		return "redirect:/toCustomer";
	}

	/**
	 * 跳转添加
	 */
	@RequestMapping("/toAddCst")
	public String toAddCst() {
		return "addcustomer";
	}

	/**
	 * 进行添加
	 */
	@RequestMapping("/doAddCst")
	public String doAddCst(HttpServletRequest request, String cust_name, String cust_region, String cust_level_label,
			int cust_satisfy, int cust_credit, String cust_addr, String cust_zip, String cust_tel, String cust_fax,
			String cust_website, String cust_licence_no, String cust_chieftain, Long cust_bankroll, Long cust_turnover,
			String cust_bank, String cust_bank_account, String cust_local_tax_no, String cust_national_tax_no, Long cust_manager_id,
			String cust_manager_name,String cust_status) {
		// 最后添加完毕后跳转分页
		Cst_Customer cst_customer = new Cst_Customer();
		Sys_User user =sys_UserServicelmpl.selectUserid(cust_manager_id);
		cst_customer.setCust_name(cust_name);
		cst_customer.setCust_region(cust_region);
		switch (cust_level_label) {
		case "I":
			cst_customer.setCust_level(1);
			break;
		case "II":
			cst_customer.setCust_level(2);
			break;
		case "III":
			cst_customer.setCust_level(3);
			break;
		case "VI":
			cst_customer.setCust_level(4);
			break;
		case "V":
			cst_customer.setCust_level(5);
			break;
		}
		cst_customer.setCust_level_label(cust_level_label);
		cst_customer.setCust_satisfy(cust_satisfy);
		cst_customer.setCust_credit(cust_credit);
		cst_customer.setCust_addr(cust_addr);
		cst_customer.setCust_zip(cust_zip);
		cst_customer.setCust_tel(cust_tel);
		cst_customer.setCust_fax(cust_fax);
		cst_customer.setCust_website(cust_website);
		cst_customer.setCust_licence_no(cust_licence_no);
		cst_customer.setCust_chieftain(cust_chieftain);
		cst_customer.setCust_bankroll(cust_bankroll);
		cst_customer.setCust_turnover(cust_turnover);
		cst_customer.setCust_bank_account(cust_bank_account);
		cst_customer.setCust_bank(cust_bank);
		cst_customer.setCust_local_tax_no(cust_local_tax_no);
		cst_customer.setCust_national_tax_no(cust_national_tax_no);
		cst_customer.setCust_status(cust_status);
		cst_customer.setCust_manager_id(cust_manager_id);
		cst_customer.setCust_manager_name(user.getUser_name());
		cst_customerServiceImpl.addCst(cst_customer);
		return "redirect:/toCustomer";
	}

	@RequestMapping("/toCustomer")
	public String toCutomer(HttpServletRequest request,String cust_name,String cust_level_label,String cust_status,
			String pageNow,String pageSize) {
		//模糊查询加入的参数
		request.setAttribute("cust_name", cust_name);
		request.setAttribute("cust_level_label", cust_level_label);
		request.setAttribute("cust_status", cust_status);
		Pages<Cst_Customer> page=cst_customerServiceImpl.getPage( cust_name, cust_level_label, cust_status, pageNow, pageSize);
		request.setAttribute("page", page);
		return "customer";
	}
	@RequestMapping(value="/selectCst",method=RequestMethod.POST,produces= {"application/json;charset=UTF-8"})
	@ResponseBody
	public Object selUserName(){
		List<Cst_Customer> cst_customer=cst_customerServiceImpl.selectCst();
	return JSON.toJSONString(cst_customer);
}
	
}
