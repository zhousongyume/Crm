package org.java.serivce;

import java.util.List;

import org.java.entity.Orders;
import org.java.entity.Sal_Chance;
import org.java.entity.Sys_User;
import org.java.utils.Pages;

public interface OrdersService {
	/*
	 * 分页
	 */
	Pages<Orders> OrdersPage(String now, String size, String odr_customer, String odr_type);
	/*
	 *添加订单
	 */
	public void Orders_Insert(Orders orders);
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
