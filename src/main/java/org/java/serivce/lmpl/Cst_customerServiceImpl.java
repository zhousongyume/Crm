package org.java.serivce.lmpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.java.dao.Cst_customerDao;
import org.java.entity.Cst_Customer;
import org.java.entity.Sal_Chance;
import org.java.serivce.Cst_customerService;
import org.java.utils.ConstSystem;
import org.java.utils.Pages;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class Cst_customerServiceImpl implements Cst_customerService {

	@Autowired
	private Cst_customerDao cst_cstomerdao;

	public List<Cst_Customer> selectCustomerInfo(Map map) {
		// TODO 自动生成的方法存根
		return cst_cstomerdao.select(map);
	}

	public Pages<Cst_Customer> getPage(String cust_name, String cust_level_label, String cust_status, String now,
			String size) {
		Pages<Cst_Customer> page = new Pages<Cst_Customer>();
		Long pageNow = 1L;
		if (now != null) {
			pageNow = Long.parseLong(now);
		}
		page.setPageNow(pageNow);
		Long pageSize = ConstSystem.PAGE_SIZE;
		if (size != null) {
			pageSize = Long.parseLong(size);
		}
		page.setPageSize(pageSize);
		Map map = new HashMap();
		map.put("pageNow", pageNow);
		map.put("pageSize", pageSize);
		map.put("cust_name", cust_name);
		map.put("cust_level_label", cust_level_label);
		map.put("cust_status", cust_status);
		Long count = cst_cstomerdao.getCount(map);
		page.setCount(count);
		Long pageCount = count % pageSize == 0 ? (count / pageSize) : (count / pageSize) + 1;
		page.setPageCount(pageCount);
		List<Cst_Customer> list = cst_cstomerdao.select(map);
		page.setList(list);
		return page;
	}

	public Cst_Customer selectCustomerById(Long cust_no) {
		// TODO 自动生成的方法存根
		return cst_cstomerdao.selectCustomerById(cust_no);
	}

	public void deleteCustomerById(Long cust_no) {
		// TODO 自动生成的方法存根
		cst_cstomerdao.deleteCustomerById(cust_no);
	}

	public void updateCst(Cst_Customer cst_customer) {
		// TODO 自动生成的方法存根
		cst_cstomerdao.updateCst(cst_customer);
	}

	public void addCst(Cst_Customer cst_customer) {
		// TODO 自动生成的方法存根
		cst_cstomerdao.addCst(cst_customer);
	}

	@Override
	public Cst_Customer selectCstByid(Long user_id) {
		// TODO Auto-generated method stub
		return cst_cstomerdao.selectCstByid(user_id);
	}

	@Override
	public List<Cst_Customer> selectCst() {
		// TODO Auto-generated method stub
		return cst_cstomerdao.selectCst();
	}

	@Override
	public int selectCountCustomerDistributionAnalysis(String cust_region) {
		// TODO Auto-generated method stub
		return cst_cstomerdao.selectCountCustomerDistributionAnalysis(cust_region);
	}

	public Pages<Cst_Customer> getPage(Long pageNow, Long pageSize, String cust_name, String cust_level_label,
			String cust_status) {
		// TODO Auto-generated method stub
		return null;
	}

}
