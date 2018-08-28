package org.java.dao.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.java.dao.Cst_lostDao;
import org.java.entity.Cst_Lost;
import org.java.mapper.Cst_lostMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Cst_lostDaoImpl implements Cst_lostDao {
@Autowired
private Cst_lostMapper cst_lostMapper;
	public Long getCount(Map map) {
		// TODO 自动生成的方法存根
		return cst_lostMapper.getCount(map);
	}

	public List<Cst_Lost> selectAllCustomer(Map map)  {
		// TODO 自动生成的方法存根
		return cst_lostMapper.selectAllCustomer(map);
	}

	public Cst_Lost selectCustomerById(Long lst_id) {
		// TODO 自动生成的方法存根
		return cst_lostMapper.selectCustomerById(lst_id);
	}


	public void updateLostCustomerById(Cst_Lost cst_lost) {
		// TODO 自动生成的方法存根
		cst_lostMapper.updateLostCustomerById(cst_lost);
	}

	public void addLostCustomer(Cst_Lost cst_lost) {
		// TODO 自动生成的方法存根
		cst_lostMapper.addLostCustomer(cst_lost);
	}


	public void deleteLostCustomerById(Long lst_id) {
		// TODO 自动生成的方法存根
		cst_lostMapper.deleteLostCustomerById(lst_id);
	}


	public Long selectLostCusIdByName(String cust_name) {
		// TODO 自动生成的方法存根
		return cst_lostMapper.selectLostCusIdByName(cust_name);
	}
	public Long selectLostCusManagerIdByName(String usr_name) {
		// TODO 自动生成的方法存根
		return cst_lostMapper.selectLostCusManagerIdByName(usr_name);
	}

	@Override
	public int selectCountLost(Date lst_last_order_date, Date lst_lost_date) {
		// TODO Auto-generated method stub
		return cst_lostMapper.selectCountLost(lst_last_order_date, lst_lost_date);
	}

}
