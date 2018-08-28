package org.java.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.java.dao.Sys_UserDao;
import org.java.entity.Sys_User;
import org.java.mapper.Sys_UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class Sys_UserDaoImpl implements Sys_UserDao {
	
	@Autowired
	private Sys_UserMapper sys_UserMapper;
	
	public Sys_UserMapper getSys_UserMapper() {
		return sys_UserMapper;
	}
	
	public void setSys_UserMapper(Sys_UserMapper sys_UserMapper) {
		this.sys_UserMapper = sys_UserMapper;
	}
	public Sys_User Sys_User_Select(Sys_User sys_user) {
		// TODO Auto-generated method stub
		return sys_UserMapper.Sys_User_Select(sys_user);
	}
	public void Sys_User_Insert(Sys_User sys_user) {
		// TODO Auto-generated method stub
		sys_UserMapper.Sys_User_Insert(sys_user);
	}

	public void Sys_User_Update(Sys_User sys_user) {
		// TODO Auto-generated method stub
		sys_UserMapper.Sys_User_Update(sys_user);
	}


	public void Sys_User_Delete(Long user_id) {
		// TODO Auto-generated method stub
		sys_UserMapper.Sys_User_Delete(user_id);
	}

	public Sys_User Sys_User_SelectById(Long user_id) {
		Sys_User user = new Sys_User();
		user.setUser_id(user_id);
		Map map = new HashMap();
		map.put("user",user);
		return sys_UserMapper.Sys_User_SelectById(map);
	}
	public List<Sys_User> Sys_User_SelectTo(Map map) {
		return sys_UserMapper.Sys_User_SelectTo(map);
	}

	public long Sys_User_SelectCountTo(Map map) {

		return sys_UserMapper.Sys_User_SelectCountTo(map);
	}

	@Override
	public Sys_User selectUserid(Long user_id) {
		// TODO Auto-generated method stub
		return sys_UserMapper.selectUserid(user_id);
	}


	


}
