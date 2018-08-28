package org.java.contller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.java.entity.Bas_Dict;
import org.java.serivce.lmpl.DictserviceImpl;
import org.java.utils.Pages;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
@Controller
public class DictController {
	@Autowired
	private DictserviceImpl dictserviceImpl;
	@RequestMapping("/dictServer")
	public String dictServer(HttpServletRequest req,String pageNow, String size, String dict_type, String dict_item, String dict_value ){
		Pages<Bas_Dict> page=dictserviceImpl.selectUserPage(pageNow, size, dict_type, dict_item, dict_value);
		 	req.setAttribute("page",page);
	        req.setAttribute("dict_type",dict_type);
	        req.setAttribute("dict_item",dict_item);
	        req.setAttribute("dict_value",dict_value);
		return "dict";
	}
	
	@RequestMapping("/dalete")
	public String  dictLook(Model mo,Long id){
		dictserviceImpl.dalete(id);
		return "redirect:dictServer";
	}
	
	@RequestMapping(value="/selectType",method=RequestMethod.POST,produces= {"application/json;charset=UTF-8"})
	@ResponseBody
	public Object  type(Model mo,String dict_type){
		List<Bas_Dict> dict = dictserviceImpl.selectBasDictJihui(dict_type);
		return JSON.toJSONString(dict);
	}
}
