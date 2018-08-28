package org.java.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.java.entity.Cst_Customer;
import org.java.entity.Sys_User;



/**
 * 客户管理
 */
public interface Cst_customerMapper {
	/**
	 * 修改用户
	 */
	public void updateCst(Cst_Customer cst_customer);
	/**
	 * 添加用户
	 */
	public void addCst(Cst_Customer cst_customer);
	/**
	 * 按照id删除
	 */
	public void deleteCustomerById(Long cust_no);
	/**
	 * 查询总客户条数信息
	 */
	public Long getCount(Map map);
	/**
	 * 查询所有客户
	 */
	public List<Cst_Customer> selectAllCustomer(Map map);
	
	/**
	 * 按照id查询客户具体信息
	 */
	public Cst_Customer selectCustomerById(Long cust_no);
	/**
	 * 客户按id查询
	 */
	public Cst_Customer selectCstByid(Long user_id);
	/**
	 * 查询全部
	 */
	public List<Cst_Customer>selectCst();
	
	/**
	 * 客户分布分析
	 */
	public int selectCountCustomerDistributionAnalysis(@Param("cust_region")String cust_region);

}
