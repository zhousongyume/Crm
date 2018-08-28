package org.java.serivce.lmpl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.java.dao.impl.Cst_lostDaoImpl;
import org.java.entity.Cst_Lost;
import org.java.entity.Sal_Chance;
import org.java.serivce.Cst_lostService;
import org.java.utils.ConstSystem;
import org.java.utils.Pages;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;
@Service
@Transactional
public class Cst_lostServiceImpl implements Cst_lostService {

	@Autowired
	private Cst_lostDaoImpl cst_lostDaoImpl;
	
	public Cst_Lost selectCustomerById(Long lst_id) {
		// TODO 自动生成的方法存根
		return cst_lostDaoImpl.selectCustomerById(lst_id);
	}

	public List<Cst_Lost> selectCustomerInfo(Map map) {
		// TODO 自动生成的方法存根
		return cst_lostDaoImpl.selectAllCustomer(map);
	}

	public Pages<Cst_Lost> getPage(String lst_cust_name, String lst_cust_manager_name, Long lst_status, String now,
			String size)  {
		Pages<Cst_Lost> page = new Pages<Cst_Lost>();
		 Long pageNow=1L;
	        if(now!=null){
	            pageNow=Long.parseLong(now);
	        }
	        page.setPageNow(pageNow);
	        Long pageSize= ConstSystem.PAGE_SIZE;
	        if(size!=null){
	            pageSize=Long.parseLong(size);
	        }
	        page.setPageSize(pageSize);
	        Map map=new HashMap();
	        map.put("pageNow",pageNow);
	        map.put("pageSize",pageSize);
	        map.put("lst_status",lst_status);
	        map.put("lst_cust_manager_name",lst_cust_manager_name);
	        map.put("lst_cust_name",lst_cust_name);
	        Long count=cst_lostDaoImpl.getCount(map);
	        page.setCount(count);
	        Long pageCount=count%pageSize==0?(count/pageSize):(count/pageSize)+1;
	        page.setPageCount(pageCount);
	        List<Cst_Lost> list =cst_lostDaoImpl.selectAllCustomer(map);
	        page.setList(list);
	        return page;
	}

	public void updateLostCustomerById(Cst_Lost cst_lost) {
		// TODO 自动生成的方法存根
		cst_lostDaoImpl.updateLostCustomerById(cst_lost);
	}

	public void addLostCustomer(Cst_Lost cst_lost) {
		// TODO 自动生成的方法存根
		cst_lostDaoImpl.addLostCustomer(cst_lost);
	}

	public void deleteLostCustomerById(Long lst_id) {
		// TODO 自动生成的方法存根
		cst_lostDaoImpl.deleteLostCustomerById(lst_id);
	}
	public Long selectLostCusIdByName(String cust_name) {
		// TODO 自动生成的方法存根
		return cst_lostDaoImpl.selectLostCusIdByName(cust_name);
	}

	public Long selectLostCusManagerIdByName(String usr_name) {
		// TODO 自动生成的方法存根
		return cst_lostDaoImpl.selectLostCusManagerIdByName(usr_name);
	}

	@Override
	public int selectCountLost(Date lst_last_order_date, Date lst_lost_date) {
		// TODO Auto-generated method stub
		return cst_lostDaoImpl.selectCountLost(lst_last_order_date, lst_lost_date);
	}



}
