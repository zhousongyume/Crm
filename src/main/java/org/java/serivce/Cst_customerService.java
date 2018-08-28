package org.java.serivce;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.java.entity.Cst_Customer;
import org.java.utils.Pages;

/**
 * 客户管理服务层
 */
public interface Cst_customerService {
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
	 * 按照id查询客户具体信息
	 */
	public Cst_Customer selectCustomerById(Long cust_no);
	/**
	 * 查询
	 */
	public List<Cst_Customer> selectCustomerInfo(Map map) ;
	
	/**
	 * 分页查询
	 */
	Pages<Cst_Customer> getPage(String cust_name,String cust_level_label,String cust_status,String now, String size) ;
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
