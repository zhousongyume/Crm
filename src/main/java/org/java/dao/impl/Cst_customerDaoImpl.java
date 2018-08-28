package org.java.dao.impl;

import java.util.List;
import java.util.Map;

import org.java.dao.Cst_customerDao;
import org.java.entity.Cst_Customer;
import org.java.mapper.Cst_customerMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Cst_customerDaoImpl implements Cst_customerDao{

	@Autowired
	private Cst_customerMapper cst_customerMapper;
	public Long getCount(Map map) {
		// TODO 自动生成的方法存根
		return cst_customerMapper.getCount(map);
	}

	public List<Cst_Customer> select(Map map) {
		// TODO 自动生成的方法存根
		return cst_customerMapper.selectAllCustomer(map);
	}
	public Cst_Customer selectCustomerById(Long cust_no) {
		// TODO 自动生成的方法存根
		return cst_customerMapper.selectCustomerById(cust_no);
	}
	public void deleteCustomerById(Long cust_no) {
		// TODO 自动生成的方法存根
		cst_customerMapper.deleteCustomerById(cust_no);
	}

	public void updateCst(Cst_Customer cst_customer) {
		// TODO 自动生成的方法存根
		cst_customerMapper.updateCst(cst_customer);
	}

	public void addCst(Cst_Customer cst_customer) {
		// TODO 自动生成的方法存根
		cst_customerMapper.addCst(cst_customer);
	}

	@Override
	public Cst_Customer selectCstByid(Long user_id) {
		// TODO Auto-generated method stub
		return cst_customerMapper.selectCstByid(user_id);
	}

	@Override
	public List<Cst_Customer> selectCst() {
		// TODO Auto-generated method stub
		return cst_customerMapper.selectCst();
	}

	@Override
	public int selectCountCustomerDistributionAnalysis(String cust_region) {
		// TODO Auto-generated method stub
		return cst_customerMapper.selectCountCustomerDistributionAnalysis(cust_region);
	}

}
