package org.java.contller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.java.entity.Cst_distributionAnalysis;
import org.java.serivce.lmpl.Cst_customerServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 客户分布分析控制层
 */
@Controller
public class cst_DistributionAnalysis {

	@Autowired
	private Cst_customerServiceImpl cst_customerServiceImpl;
	
	@RequestMapping("/toCustomerDistributionAnalysis")
	public String toCustomerDistributionAnalysis(HttpServletRequest request){
		List<Cst_distributionAnalysis> list=new ArrayList<Cst_distributionAnalysis>();
		/*分布地理位置*/
		Cst_distributionAnalysis cst_distributionAnalysis=new Cst_distributionAnalysis();
		cst_distributionAnalysis.setCust_region("湖北");
		cst_distributionAnalysis.setCount(cst_customerServiceImpl.selectCountCustomerDistributionAnalysis("湖北"));
		Cst_distributionAnalysis cst_distributionAnalysis1=new Cst_distributionAnalysis();
		cst_distributionAnalysis1.setCust_region("上海");
		cst_distributionAnalysis1.setCount(cst_customerServiceImpl.selectCountCustomerDistributionAnalysis("上海"));
		Cst_distributionAnalysis cst_distributionAnalysis2=new Cst_distributionAnalysis();
		cst_distributionAnalysis2.setCust_region("北京");
		cst_distributionAnalysis2.setCount(cst_customerServiceImpl.selectCountCustomerDistributionAnalysis("北京"));
		Cst_distributionAnalysis cst_distributionAnalysis3=new Cst_distributionAnalysis();
		cst_distributionAnalysis3.setCust_region("广州");
		cst_distributionAnalysis3.setCount(cst_customerServiceImpl.selectCountCustomerDistributionAnalysis("广州"));
		list.add(cst_distributionAnalysis);
		list.add(cst_distributionAnalysis1);
		list.add(cst_distributionAnalysis2);
		list.add(cst_distributionAnalysis3);
		//二维数组
				List<List> data=new ArrayList<>();
				for (int i = 0; i < list.size(); i++) {
					Cst_distributionAnalysis lost=list.get(i);
					List row=new ArrayList<>();
					row.add("'"+lost.getCust_region()+"'");
					row.add(lost.getCount());
					row.add(100*lost.getCount());
					data.add(row);
				}
				request.setAttribute("data", data);
		return "customerDistributionAnalysis";
	}
}
