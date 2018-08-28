package org.java.contller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import javax.servlet.http.HttpServletRequest;
import org.java.entity.Orders;

import org.java.serivce.lmpl.OrdersServiceimpl;
import org.java.utils.Pages;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class OrdersContller {
	@Autowired
	private OrdersServiceimpl ordersServiceimpl;

	public OrdersServiceimpl getOrdersServiceimpl() {
		return ordersServiceimpl;
	}

	public void setOrdersServiceimpl(OrdersServiceimpl ordersServiceimpl) {
		this.ordersServiceimpl = ordersServiceimpl;
	}

	@RequestMapping("/orderShow")
	public String select(String pageNow, String pageSize, String odr_customer, String odr_type,
			HttpServletRequest req) {
		if ("0".equals(odr_type) || odr_type == null) {
			odr_type = "";
		}
		Pages<Orders> Orders_pages = ordersServiceimpl.OrdersPage(pageNow, pageSize, odr_customer, odr_type);
		req.setAttribute("Orders_pages", Orders_pages);
		req.setAttribute("odr_customer", odr_customer);
		req.setAttribute("odr_type", odr_type);
		return "orders";
	}

	@RequestMapping("/orderinsert")
	public String insert() {
		return "ordersinsert";
	}

	@RequestMapping("/ordersadd")
	public String chancemanageinsert(String odr_customer, String odr_date, String odr_type, Double odr_cost)
			throws ParseException {

		Orders order = new Orders();
		order.setOdr_customer(odr_customer);
		SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd");
		order.setOdr_date(s.parse(odr_date));
		order.setOdr_type(odr_type);
		order.setOdr_cost(odr_cost);
		ordersServiceimpl.Orders_Insert(order);
		return "forward:orderShow?pageNum=1";
	}

	@RequestMapping("/orderchakan")
	public String orderchakan(Model mo, int id) {
		Orders orders = ordersServiceimpl.selectOrderByid(id);
		mo.addAttribute("orders", orders);
		return "orderchakan";
	}

	@RequestMapping("/orderupdatechaxun")
	public String orderupdatechaxun(Model mo, int id) {
		Orders orders = ordersServiceimpl.selectOrderByid(id);
		mo.addAttribute("orders", orders);
		return "ordersassign";
	}

	@RequestMapping("/ordersupdate")
	public String ordersupdate(Long odr_id, String odr_customer, String odr_date, String odr_type, Double odr_cost)
			throws ParseException {

		Orders order = new Orders();
		order.setOdr_id(odr_id);
		order.setOdr_customer(odr_customer);
		SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd");
		order.setOdr_date(s.parse(odr_date));
		order.setOdr_type(odr_type);
		order.setOdr_cost(odr_cost);
		ordersServiceimpl.Orders_Update(order);
		return "forward:orderShow?pageNum=1";
	}

	@RequestMapping("/orderdelete")
	public String orderdelete(Model mo, Long id) {
		ordersServiceimpl.Order_Delete(id);
		return "forward:orderShow?pageNum=1";
	}
}
