package org.java.dao;

import java.util.List;
import java.util.Map;

import org.java.entity.Sal_Chance;
import org.java.entity.Sys_User;

public interface Sal_ChanceDao {
	/*
	 * 用户添加
	 */
	public void Sal_Chance_Insert(Sal_Chance chance);
	
	/*
	 * 模糊查询机会信息
	 */
	public List<Sal_Chance> Sal_Chance_Select(Map map);
	
	/*
	 * 模糊查询总条数
	 */
	public Long Sal_Chance_SelectCount(Map map);
	
	/*
	 * 修改
	 */
	public void Sal_chance_Update(Sal_Chance chance);
	
	/*
	 * 查询用户全部信息
	 */
	public List<Sys_User> SelectUserName();
	
	/*
	 *按id查询用户信息
	 */
	public Sal_Chance selectUserNameByid(Long id);
	/*
	 * 用户删除
	 */
	public void Sal_chance_Delete(Long usr_id);


	
}