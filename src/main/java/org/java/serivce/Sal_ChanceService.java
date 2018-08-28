package org.java.serivce;

import java.util.List;
import org.java.entity.Sal_Chance;
import org.java.entity.Sys_User;
import org.java.utils.Pages;

public interface Sal_ChanceService {
	/*
	 * 分页
	 */
	Pages<Sal_Chance> Sal_ChancePage(String now, String size,String chc_cust_name, String chc_title, String chc_linkman);
	/*
	 * 用户添加
	 */
	public void Sal_Chance_Insert(Sal_Chance chance);
	
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
