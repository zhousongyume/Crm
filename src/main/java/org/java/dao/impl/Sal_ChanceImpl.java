package org.java.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.java.dao.Sal_ChanceDao;
import org.java.entity.Sal_Chance;
import org.java.entity.Sys_User;
import org.java.mapper.Sal_ChanceMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class Sal_ChanceImpl implements Sal_ChanceDao{
	@Autowired
	private Sal_ChanceMapper sal_ChanceMapper;
	public Sal_ChanceMapper getSal_ChanceMapper() {
		return sal_ChanceMapper;
	}
	public void setSal_ChanceMapper(Sal_ChanceMapper sal_ChanceMapper) {
		this.sal_ChanceMapper = sal_ChanceMapper;
	}
	
	
	public void Sal_Chance_Insert(Sal_Chance chance) {
		// TODO Auto-generated method stub
		sal_ChanceMapper.Sal_Chance_Insert(chance);
		
	}
	public List<Sal_Chance> Sal_Chance_Select(Map map) {
		return sal_ChanceMapper.Sal_Chance_Select(map);
	}
	public Long Sal_Chance_SelectCount(Map map) {
		return sal_ChanceMapper.Sal_Chance_SelectCount(map);

	}

	public void Sal_chance_Update(Sal_Chance chance) {
		sal_ChanceMapper.Sal_chance_Update(chance);
		
	}

	public List<Sys_User> SelectUserName() {
		// TODO Auto-generated method stub
		return sal_ChanceMapper.SelectUserName();
	}
	public Sal_Chance selectUserNameByid(Long id) {
		// TODO Auto-generated method stub
		return sal_ChanceMapper.selectUserNameByid(id);
	}
	@Override
	public void Sal_chance_Delete(Long usr_id) {
		// TODO Auto-generated method stub
		sal_ChanceMapper.Sal_chance_Delete(usr_id);
	}


}
