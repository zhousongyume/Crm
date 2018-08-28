package org.java.mapper;

import java.util.List;
import java.util.Map;

import org.java.entity.Sal_Chance;
import org.java.entity.Sal_Plan;
import org.java.entity.Sys_User;

public interface Sal_PlanMapper {
	
	/*
	 * 模糊查询机会信息
	 */
	public List<Sal_Chance> Sal_Chance_Select(Map map);
	
	/*
	 * 模糊查询总条数
	 */
	public Long Sal_Chance_SelectCount(Map map);
	
	/*
	 * 查询用户全部信息
	 */
	public List<Sys_User> SelectUserName();
	
	/*
	 *按id查询用户信息
	 */
	public Sal_Chance selectUserNameByid(int id);
	
	/*
	 *按id查询销售计划
	 */
	public List<Sal_Plan> Sal_Plan_SelectByid(int id);
	
	/*
	 *查询用户状态信息
	 */
	public int Select_Sal_Chance_status();
	
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
