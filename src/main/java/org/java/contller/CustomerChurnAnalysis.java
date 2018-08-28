package org.java.contller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.java.entity.Cst_lostChurnAnalysis;
import org.java.serivce.lmpl.Cst_lostServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


/**
 * 客户流失分析控制层
 */
@Controller
public class CustomerChurnAnalysis {
	@Autowired
	private Cst_lostServiceImpl cst_lostServiceImpl;

	/**
	 * 客户流失数据分析
	 */
	@RequestMapping("/toCustomerChurnAnalysis")
	public String toCustomerChurnAnalysis(HttpServletRequest request) throws ParseException{
		List<Cst_lostChurnAnalysis> list=new ArrayList<>();
		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");  
		for (int i = 1; i <= 12; i++) {
			Cst_lostChurnAnalysis cst_lostChurnAnalysis=new Cst_lostChurnAnalysis();
			String lst_last_order_date ="2018-"+i+"-01";
			String lst_lost_date="2018-"+(i+1)+"-01";
			if (i==12) {
				lst_last_order_date="2018-12-1";
				 lst_lost_date="2019-01-01";
			}
			Date start = sf.parse(lst_last_order_date);  
			Date end=sf.parse(lst_lost_date);  
			cst_lostChurnAnalysis.setCount(cst_lostServiceImpl.selectCountLost(start,end));
			cst_lostChurnAnalysis.setMonth(i+"月");
			list.add(cst_lostChurnAnalysis);
		}
		//二维数组
		List<List> data=new ArrayList<>();
		for (int i = 0; i < list.size(); i++) {
			Cst_lostChurnAnalysis lost=list.get(i);
			List row=new ArrayList<>();
			row.add("'"+lost.getMonth()+"'");
			row.add(lost.getCount());
			data.add(row);
		}
		request.setAttribute("data", data);
		return "customerChurnAnalysis";
	}
	
}
