package org.java.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.java.entity.Cst_Lost;

public interface Cst_lostDao {
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
	 * 查询总客户条数信息
	 */
	public Long getCount(Map map);
	/**
	 * 查询所有客户
	 */
	public List<Cst_Lost> selectAllCustomer(Map map);
	
	/**
	 * 按照id查询客户具体信息
	 */
	public Cst_Lost selectCustomerById(Long lst_id);
	/**
	 * 客户流失数据分析
	 */
	
	public int selectCountLost(@Param("lst_last_order_date")Date lst_last_order_date,@Param("lst_lost_date")Date lst_lost_date);
}
