package org.java.contller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.java.dao.Sct_ServiceDao;
import org.java.entity.CusServiceAnalysis;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
/**
 * 客户服务分析
 */
@Controller
public class CustomerServiceAnalysis {
	 @Autowired
	 private Sct_ServiceDao sctServiceDao;

	public Sct_ServiceDao getSctServiceDao() {
		return sctServiceDao;
	}

	public void setSctServiceDao(Sct_ServiceDao sctServiceDao) {
		this.sctServiceDao = sctServiceDao;
	}
	
	@RequestMapping("/toCustomerServiceAnalysis")
	public String toCustomerServiceAnalysis(HttpServletRequest request) throws ParseException{
		List<CusServiceAnalysis> list1=new ArrayList<CusServiceAnalysis>();
		List<CusServiceAnalysis> list2=new ArrayList<CusServiceAnalysis>();
		List<CusServiceAnalysis> list3=new ArrayList<CusServiceAnalysis>();
		List<List> data2=new ArrayList<>();
		List<List> data1=new ArrayList<>();
		List<List> data3=new ArrayList<>();
		SimpleDateFormat sf=new SimpleDateFormat("yyyy-MM-dd");
		/*思路区分三大类别*/
		//咨询
		for (int i = 1; i <=12; ) {
			CusServiceAnalysis cusServiceAnalysis=new CusServiceAnalysis();
			String svr_create_date="2018-"+i+"-01";
			String svr_create_date1="2018-"+(i+3)+"-01";
			if (i==10) {
				//最后一个季度
				svr_create_date="2018-10-1";
				svr_create_date1="2018-12-31";
			}
			Date start=sf.parse(svr_create_date);
			Date end=sf.parse(svr_create_date1);
			cusServiceAnalysis.setCount(sctServiceDao.selectCusServiceAnalysisCount(start, end, "咨询"));
			list1.add(cusServiceAnalysis);
			i=i+3;
		}
		//二维数组
				for (int i = 0; i < list1.size(); i++) {
					CusServiceAnalysis lost=list1.get(i);
					List row=new ArrayList<>();
					row.add(lost.getCount());
					data1.add(row);
				}
		//投诉
				for (int i = 1; i <=12; ) {
					CusServiceAnalysis cusServiceAnalysis=new CusServiceAnalysis();
					String svr_create_date="2018-"+i+"-01";
					String svr_create_date1="2018-"+(i+3)+"-01";
					if (i==10) {
						//最后一个季度
						svr_create_date="2018-10-1";
						svr_create_date1="2018-12-31";
					}
					Date start=sf.parse(svr_create_date);
					Date end=sf.parse(svr_create_date1);
					cusServiceAnalysis.setCount(sctServiceDao.selectCusServiceAnalysisCount(start, end, "投诉"));
					list2.add(cusServiceAnalysis);
					i=i+3;
				}
				//二维数组
						for (int i = 0; i < list2.size(); i++) {
							CusServiceAnalysis lost=list2.get(i);
							List row=new ArrayList<>();
							row.add(lost.getCount());
							data2.add(row);
						}
		
		
		//建议
						for (int i = 1; i <=12; ) {
							CusServiceAnalysis cusServiceAnalysis=new CusServiceAnalysis();
							String svr_create_date="2018-"+i+"-01";
							String svr_create_date1="2018-"+(i+3)+"-01";
							if (i==10) {
								//最后一个季度
								svr_create_date="2018-10-1";
								svr_create_date1="2018-12-31";
							}
							Date start=sf.parse(svr_create_date);
							Date end=sf.parse(svr_create_date1);
							cusServiceAnalysis.setCount(sctServiceDao.selectCusServiceAnalysisCount(start, end, "建议"));
							list3.add(cusServiceAnalysis);
							i=i+3;
						}
						//二维数组
								for (int i = 0; i < list3.size(); i++) {
									CusServiceAnalysis lost=list3.get(i);
									List row=new ArrayList<>();
									row.add(lost.getCount());
									data3.add(row);
								}
		
				//最后将三组数据传输到jsp页面
				request.setAttribute("data1", data1);
				request.setAttribute("data2", data2);
				request.setAttribute("data3", data3);
		return "customerServiceAnalysis";
	}
}
