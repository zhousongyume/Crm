package org.java.serivce;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.java.entity.Cst_Lost;
import org.java.utils.Pages;

public interface Cst_lostService {
	/**
	 * 添加流失客户根据名称查找id
	 */
	public Long selectLostCusIdByName(String cust_name);
	/**
	 * 添加流失客户所属经理根据名称查找id
	 */
	public Long selectLostCusManagerIdByName(String usr_name);
	/**
	 * 修改流失用户
	 */
	public void updateLostCustomerById(Cst_Lost cst_lost);
	/**
	 * 添加流失用户
	 */
	public void addLostCustomer(Cst_Lost cst_lost);
	/**
	 * 对于回归客户清除在流失表中的数据
	 */
	public void deleteLostCustomerById(Long lst_id);
	/**
	 * 按照id查询客户具体信息
	 */
	public Cst_Lost selectCustomerById(Long lst_id);
	/**
	 * 查询
	 */
	public List<Cst_Lost> selectCustomerInfo(Map map);
	
	/**
	 * 分页查询
	 */
	Pages<Cst_Lost> getPage(String lst_cust_name,String lst_cust_manager_name,Long lst_status,String now, String size);
	/**
	 * 客户流失数据分析
	 */
	
	public int selectCountLost(@Param("lst_last_order_date")Date lst_last_order_date,@Param("lst_lost_date")Date lst_lost_date);
}
