package org.java.serivce.lmpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.java.dao.OrdersDao;
import org.java.dao.Sal_ChanceDao;
import org.java.entity.Orders;
import org.java.entity.Sal_Chance;
import org.java.entity.Sys_User;
import org.java.serivce.OrdersService;
import org.java.serivce.Sal_ChanceService;
import org.java.serivce.Sal_PlanService;
import org.java.utils.ConstSystem;
import org.java.utils.Pages;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrdersServiceimpl implements OrdersService {
	@Autowired
	private OrdersDao OrderssDao;
	public OrdersDao getOrderssDao() {
		return OrderssDao;
	}

	public void setOrderssDao(OrdersDao orderssDao) {
		OrderssDao = orderssDao;
	}
	public void Orders_Insert(Orders orders) {
		// TODO Auto-generated method stub
		OrderssDao.Orders_Insert(orders);
	}
	public void Orders_Update(Orders orders) {
		// TODO Auto-generated method stub
		OrderssDao.Orders_Update(orders);

	}
	public List<Orders> SelectOrders() {
		// TODO Auto-generated method stub
		return OrderssDao.SelectOrders();
	}


	public Orders selectOrderByid(int id) {
		// TODO Auto-generated method stub
		return OrderssDao.selectOrderByid(id);
	}

	public void Order_Delete(Long id) {
		// TODO Auto-generated method stub
		OrderssDao.Order_Delete(id);
	}

	@Override
	public Pages<Orders> OrdersPage(String now, String size, String odr_customer, String odr_type) {
		Pages<Orders> page=new Pages<Orders>();
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
        map.put("odr_customer",odr_customer);
        map.put("odr_type",odr_type);
        Long count=OrderssDao.Orders_SelectCount(map);
        page.setCount(count);
        Long pageCount=count%pageSize==0?(count/pageSize):(count/pageSize)+1;
        page.setPageCount(pageCount);
        List<Orders> list =OrderssDao.Orders_Select_Mo(map);
        page.setList(list);
        return page;
	}

	@Override
	public List<Orders> CusContributionAnalysis(String odr_type) {
		// TODO Auto-generated method stub
		return OrderssDao.CusContributionAnalysis(odr_type);
	}

}
