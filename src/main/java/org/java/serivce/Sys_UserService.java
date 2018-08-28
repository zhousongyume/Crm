package org.java.serivce;
import org.java.entity.Sys_User;
import org.java.utils.Pages;

public interface Sys_UserService {
	/*
	 * 分页
	 */
	Pages<Sys_User> Sys_UserPage(String now, String size, String user_name, String user_role_id);
	/*
	 * 按登陆名称和登陆密码查询
	 */
	public Sys_User Sys_User_Select(Sys_User sys_user);
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
	public void Sys_User_Delete(Long user_id);
	
	/*
	 * 用户按id查询
	 */
	public Sys_User Sys_User_SelectById(Long user_id);
	
	/*
	 * 用户按id查询
	 */
	public Sys_User selectUserid(Long user_id);
	

}
