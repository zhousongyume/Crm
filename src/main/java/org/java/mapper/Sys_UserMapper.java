package org.java.mapper;

import java.util.List;
import java.util.Map;

import org.java.entity.Sys_User;

public interface Sys_UserMapper {
	/*
	 * 按登陆名称和登陆密码查询
	 */
	public Sys_User Sys_User_Select(Sys_User sys_user);
	/*
	 *模糊查询
	 */
	public List<Sys_User> Sys_User_SelectTo(Map map);
	/*
	 * 模糊总条数
	 */
	public Long Sys_User_SelectCountTo(Map map);
	
	/*
	 * 用户添加
	 */
	public void Sys_User_Insert(Sys_User sys_user);
	
	/*
	 * 用户修改
	 */
	public void Sys_User_Update(Sys_User sys_user);
	
	/*
	 * 用户删除
	 */
	public void Sys_User_Delete(Long usr_id);
	
	/*
	 * 用户按id查询
	 */
	public Sys_User Sys_User_SelectById(Map map);
	
	/*
	 * 用户按id查询
	 */
	public Sys_User selectUserid(Long user_id);

	

}
