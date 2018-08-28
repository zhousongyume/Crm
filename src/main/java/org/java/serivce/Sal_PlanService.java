package org.java.serivce;

import java.util.List;

import org.java.dao.Sal_PlanDao;
import org.java.entity.Sal_Chance;
import org.java.entity.Sal_Plan;
import org.java.entity.Sys_User;
import org.java.utils.Pages;

public interface Sal_PlanService {
	/*
	 * 分页
	 */
	Pages<Sal_Chance> Sal_ChancePage(String now, String size,String chc_cust_name, String chc_title, String chc_linkman);
	/*
	 * 查询用户全部信息
	 */
	public List<Sys_User> SelectUserName();
	
	/*
	 *按id查询用户信息
	 */
	public Sal_Chance selectUserNameByid(int id);
	
	/*
	 *查询用户状态信息
	 */
	public int Select_Sal_Chance_status();
	
	/*
	 *按id查询销售计划
	 */
	public List<Sal_Plan> Sal_Plan_SelectByid(int id);
	
	/*
	 *删除
	 */
	public void Sal_Plan_Delete(int id);

	/*
	 * 修改销售计划信息
	 */
	public int Update_Sal_Plan(Sal_Plan sal_Plan);
	
	/*
	 * 添加销售计划信息
	 */
	public int Sal_Plan_Insert(Sal_Plan sal_Plan);
	
	/*
	 * 修改状态
	 */
	public int updateStatus(Sal_Chance sal_Chance);
	
}
