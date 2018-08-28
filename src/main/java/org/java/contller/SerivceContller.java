package org.java.contller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.apache.ibatis.annotations.Param;
import org.java.entity.Sal_Chance;
import org.java.entity.Sct_Service;
import org.java.entity.Sys_User;
import org.java.serivce.lmpl.Sal_ChanceServiceimpl;
import org.java.serivce.lmpl.Sct_ServiceServiceimpl;
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
public class SerivceContller {
	@Autowired
	private Sct_ServiceServiceimpl sct_ServiceServiceimpl;
	private Sys_UserServicelmpl sys_UserServicelmpl;
	
	public Sct_ServiceServiceimpl getSct_ServiceServiceimpl() {
		return sct_ServiceServiceimpl;
	}
	public void setSct_ServiceServiceimpl(Sct_ServiceServiceimpl sct_ServiceServiceimpl) {
		this.sct_ServiceServiceimpl = sct_ServiceServiceimpl;
	}
    @RequestMapping("/serviceManage")
    public String serviceManage(String pageNow, String pageSize, String svr_cust_name, String svr_title,
                                String svr_type, String svr_create_date, String svr_create_date1, String svr_result, HttpServletRequest req){
        if(svr_result==null || svr_result==""){
            svr_result="已分配";
        }
        Pages<Sct_Service> sct_servicePage = sct_ServiceServiceimpl.selectSctPage(pageNow, pageSize, svr_cust_name, svr_title, svr_type, svr_create_date, svr_create_date1, svr_result);
        req.setAttribute("sct_servicePage",sct_servicePage);
        req.setAttribute("svr_cust_name",svr_cust_name);
        req.setAttribute("svr_title",svr_title);
        req.setAttribute("svr_type",svr_type);
        req.setAttribute("svr_create_date",svr_create_date);
        req.setAttribute("svr_create_date1",svr_create_date1);
        req.setAttribute("svr_result",svr_result);
        return "serviceManage";
    }

    @RequestMapping("/serviceCreate")
    public String serviceCreate(){

        return "serviceCreate";
    }
    @RequestMapping("/toServiceCreate")
    public String toServiceCreate(String svr_type,String svr_title,String svr_cust_name,
    String svr_request,Long svr_create_id,String svr_create_by,String svr_create_date,String svr_result,Long svr_due_id,String svr_due_to,String svr_due_date) throws ParseException {
    	 svr_due_to = sct_ServiceServiceimpl.userById(svr_due_id);
        SimpleDateFormat s=new SimpleDateFormat("yyyy-MM-dd");
        Map map=new HashMap();
        map.put("svr_type",svr_type);
        map.put("svr_title",svr_title);
        map.put("svr_cust_name",svr_cust_name);
        map.put("svr_request",svr_request);
        map.put("svr_create_id",svr_create_id);
        map.put("svr_create_by",svr_create_by);
        map.put("svr_create_date",s.parse(svr_create_date));
        map.put("svr_result",svr_result);
        map.put("svr_due_id", svr_due_id);
        map.put("svr_due_to", svr_due_to);
        map.put("svr_due_date",s.parse(svr_due_date));
        sct_ServiceServiceimpl.addSct(map);
        return "redirect:serviceManage";
    }

    @RequestMapping("/serviceAssign")
    public String serviceAssign(String pageNow, String pageSize, String svr_cust_name, String svr_title,
                                String svr_type, String svr_create_date, String svr_create_date1, String svr_result, HttpServletRequest req){
        if(svr_result==null || svr_result==""){
            svr_result="新创建";
        }
        Pages<Sct_Service> sct_servicePage = sct_ServiceServiceimpl.selectSctPage(pageNow, pageSize, svr_cust_name, svr_title, svr_type, svr_create_date, svr_create_date1, svr_result);
        req.setAttribute("sct_servicePage",sct_servicePage);
        req.setAttribute("svr_cust_name",svr_cust_name);
        req.setAttribute("svr_title",svr_title);
        req.setAttribute("svr_type",svr_type);
        req.setAttribute("svr_create_date",svr_create_date);
        req.setAttribute("svr_create_date1",svr_create_date1);
        req.setAttribute("svr_result",svr_result);
        return "serviceAssign";
    }

	public Sys_UserServicelmpl getSys_UserServicelmpl() {
		return sys_UserServicelmpl;
	}
	public void setSys_UserServicelmpl(Sys_UserServicelmpl sys_UserServicelmpl) {
		this.sys_UserServicelmpl = sys_UserServicelmpl;
	}
	@RequestMapping("/serviceLookup")
    public String serviceLookup(Long id,HttpServletRequest req){
        Sct_Service sct_service = sct_ServiceServiceimpl.selectSctById(id);
        req.setAttribute("sct_service",sct_service);
        return "serviceLookup";
    }


    @RequestMapping("/serviceDate")
    public String serviceDate(String pageNow, String pageSize, String svr_cust_name, String svr_title,
                                String svr_type, String svr_create_date, String svr_create_date1, String svr_result, HttpServletRequest req){
        Pages<Sct_Service> sct_servicePage = sct_ServiceServiceimpl.selectSctPage(pageNow,pageSize,svr_cust_name,svr_title,svr_type,svr_create_date,svr_create_date1,svr_result);
        req.setAttribute("sct_servicePage",sct_servicePage);
        req.setAttribute("svr_cust_name",svr_cust_name);
        req.setAttribute("svr_title",svr_title);
        req.setAttribute("svr_type",svr_type);
        req.setAttribute("svr_create_date",svr_create_date);
        req.setAttribute("svr_create_date1",svr_create_date1);
        req.setAttribute("svr_result",svr_result);
        return "serviceDate";
    }

    @RequestMapping("/serviceSct")
    public String serviceSct(Long id,HttpServletRequest req){
        Sct_Service sct_service = sct_ServiceServiceimpl.selectSctById(id);
        req.setAttribute("sct_service",sct_service);
        return "serviceSct";
    }
    @RequestMapping("/updateSct")
    public String updateSct(Long svr_id,String svr_deal,
     String svr_deal_by,String svr_deal_date,String svr_result,int svr_satisfy) throws ParseException {
        SimpleDateFormat s=new SimpleDateFormat("yyyy-MM-dd");
        Map map=new HashMap();
        map.put("svr_id",svr_id);
        map.put("svr_deal_by",svr_deal_by);
        map.put("svr_deal",svr_deal);
        map.put("svr_deal_date",s.parse(svr_deal_date));
        map.put("svr_result",svr_result);
        map.put("svr_satisfy",svr_satisfy);
        sct_ServiceServiceimpl.updateSct(map);
        return "redirect:serviceDate";
    }
    @RequestMapping("/delSct")
    public String delSct(Long svr_id){
    	sct_ServiceServiceimpl.delSct(svr_id);
        return "redirect:serviceAssign";
    }
    @RequestMapping("/updateSeriverchu")
    public String updateSct(String svr_result,Long svr_id,Long svr_deal_id){
    	 Map map=new HashMap();
         map.put("svr_id",svr_id);
         map.put("svr_deal_id",svr_deal_id);
         map.put("svr_result","已分配");
         sct_ServiceServiceimpl.updateSeriverchu(map);
        return "redirect:serviceAssign";
    }

}
