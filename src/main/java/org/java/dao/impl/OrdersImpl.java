package org.java.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.java.dao.OrdersDao;
import org.java.entity.Orders;
import org.java.mapper.OrderMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class OrdersImpl implements OrdersDao{
	@Autowired
	private OrderMapper orderMapper;

	public OrderMapper getOrderMapper() {
		return orderMapper;
	}

	public void setOrderMapper(OrderMapper orderMapper) {
		this.orderMapper = orderMapper;
	}

	public void Orders_Insert(Orders orders) {
		// TODO Auto-generated method stub
		orderMapper.Orders_Insert(orders);
	}


	public List<Orders> Orders_Select_Mo(Map map) {
		return orderMapper.Orders_Select_Mo(map);
	}

	public long Orders_SelectCount(Map map) {
		return orderMapper.Orders_SelectCount(map);
	}

	public void Orders_Update(Orders orders) {
		// TODO Auto-generated method stub
		orderMapper.Orders_Update(orders);
		
	}


	public List<Orders> SelectOrders() {
		// TODO Auto-generated method stub
		return orderMapper.SelectOrders();
	}


	public Orders selectOrderByid(int id) {
		// TODO Auto-generated method stub
		return orderMapper.selectOrderByid(id);
	}

	public void Order_Delete(Long id) {
		// TODO Auto-generated method stub
		orderMapper.Order_Delete(id);
		
	}

	@Override
	public List<Orders> CusContributionAnalysis(String odr_type) {
		// TODO Auto-generated method stub
		return orderMapper.CusContributionAnalysis(odr_type);
	}
	
	
	

}
