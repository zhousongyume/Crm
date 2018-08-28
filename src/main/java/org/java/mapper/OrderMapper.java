package org.java.mapper;

import java.util.List;
import java.util.Map;

import javax.persistence.criteria.Order;

import org.java.entity.Orders;
import org.java.entity.Sal_Chance;
import org.java.entity.Sys_User;

public interface OrderMapper {
	
	/*
	 *添加订单
	 */
	public void Orders_Insert(Orders orders);
	
	/*
	 * 模糊查询订单信息
	 */
	public List<Orders> Orders_Select_Mo(Map map);
	
	/*
	 * 模糊查询总条数
	 */
	public long Orders_SelectCount(Map map);
	
	
	/*
	 * 修改
	 */
	public void Orders_Update(Orders orders);
	
	/*
	 * 查询订单全部信息
	 */
	public List<Orders> SelectOrders();
	
	/*
	 *按id查询订单信息
	 */
	public Orders selectOrderByid(int id);
	
	/*
	 *删除
	 */
	public void Order_Delete(Long id);
	
	/*
	 * 客户贡献分析
	 */
	public List<Orders> CusContributionAnalysis(String odr_type);


}
