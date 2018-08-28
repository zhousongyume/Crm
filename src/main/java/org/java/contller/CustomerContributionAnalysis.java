package org.java.contller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.java.entity.Orders;
import org.java.serivce.lmpl.OrdersServiceimpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;

import org.springframework.web.bind.annotation.RequestMapping;
/**
 * 客户贡献分析
 */
@Controller
public class CustomerContributionAnalysis {
 
	@Autowired
	private  OrdersServiceimpl ordersServiceImpl;
	
	@RequestMapping("/toCustomerContributionAnalysis")
	public String toCustomerContributionAnalysis(HttpServletRequest request){
		/*思路按照类型区分数据源*/
		List<Orders> list1=ordersServiceImpl.CusContributionAnalysis("电子产品");
		List<Orders> list2=ordersServiceImpl.CusContributionAnalysis("生活用品");
		List<List> data2=new ArrayList<>();
		List<List> data1=new ArrayList<>();
		//二维数组
		for (int i = 0; i < list1.size(); i++) {
			Orders lost=list1.get(i);
			List row=new ArrayList<>();
			row.add(lost.getOdr_cost());
			data1.add(row);
		}
		//二维数组
		for (int i = 0; i < list2.size(); i++) {
			Orders lost=list2.get(i);
			List row=new ArrayList<>();
			row.add(lost.getOdr_cost());
			data2.add(row);
		}
		//最后将两组数据传输到jsp页面
		request.setAttribute("data1", data1);
		request.setAttribute("data2", data2);
		return "customerContributionAnalysis";
	}
}
