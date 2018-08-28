package org.java.serivce.lmpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.java.dao.Sys_UserDao;
import org.java.entity.Sct_Service;
import org.java.entity.Sys_User;
import org.java.serivce.Sys_UserService;
import org.java.utils.ConstSystem;
import org.java.utils.Pages;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
@Service
public class Sys_UserServicelmpl implements Sys_UserService {
	@Autowired
	private Sys_UserDao sys_UserDao;
	
	public Sys_UserDao getSys_UserDao() {
		return sys_UserDao;
	}

	public void setSys_UserDao(Sys_UserDao sys_UserDao) {
		this.sys_UserDao = sys_UserDao;
	}


	public Sys_User Sys_User_Select(Sys_User sys_user) {
		// TODO Auto-generated method stub
		return sys_UserDao.Sys_User_Select(sys_user);
	}

	public void Sys_User_Insert(Sys_User sys_user) {
		sys_UserDao.Sys_User_Insert(sys_user);
		
	}


	public void Sys_User_Update(Sys_User sys_user) {
		sys_UserDao.Sys_User_Update(sys_user);
		
	}


	public void Sys_User_Delete(Long user_id) {
		// TODO Auto-generated method stub
		sys_UserDao.Sys_User_Delete(user_id);
	}

	public Sys_User Sys_User_SelectById(Long user_id) {
		// TODO Auto-generated method stub
		return sys_UserDao.Sys_User_SelectById(user_id);
	}

	@Override
	public Pages<Sys_User> Sys_UserPage(String now, String size, String user_name, String user_role_id) {
		  Pages<Sys_User> page=new Pages<Sys_User>();
	        Long pageNow=1L;
	        if(now!=null){
	            pageNow=Long.parseLong(now);
	        }
	        page.setPageNow(pageNow);
	        Long pageSize= ConstSystem.PAGE_SIZE;
	        if(size!=null){
	            pageSize=Long.parseLong(size);
	        }
	        page.setPageSize(pageSize);
	        Map map=new HashMap();
	        map.put("pageNow",pageNow);
	        map.put("pageSize",pageSize);
	        map.put("user_name",user_name);
	        map.put("user_role_id",user_role_id);
	        Long count=sys_UserDao.Sys_User_SelectCountTo(map);
	        page.setCount(count);
	        Long pageCount=count%pageSize==0?(count/pageSize):(count/pageSize)+1;
	        page.setPageCount(pageCount);
	        List<Sys_User> list =sys_UserDao.Sys_User_SelectTo(map);
	        page.setList(list);
	        return page;
	}

	@Override
	public Sys_User selectUserid(Long user_id) {
		// TODO Auto-generated method stub
		return sys_UserDao.selectUserid(user_id);
	}

}
