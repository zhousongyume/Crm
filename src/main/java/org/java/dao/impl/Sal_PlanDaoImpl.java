package org.java.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.java.dao.Sal_ChanceDao;
import org.java.dao.Sal_PlanDao;
import org.java.entity.Sal_Chance;
import org.java.entity.Sal_Plan;
import org.java.entity.Sys_User;
import org.java.mapper.Sal_ChanceMapper;
import org.java.mapper.Sal_PlanMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class Sal_PlanDaoImpl implements Sal_PlanDao{
	@Autowired
	private Sal_PlanMapper sal_PlanMapper;
	
	
	public Sal_PlanMapper getSal_PlanMapper() {
		return sal_PlanMapper;
	}
	public void setSal_PlanMapper(Sal_PlanMapper sal_PlanMapper) {
		this.sal_PlanMapper = sal_PlanMapper;
	}
	
	public List<Sal_Chance> Sal_Chance_Select(Map map) {
		return sal_PlanMapper.Sal_Chance_Select(map);
	}
	public Long Sal_Chance_SelectCount(Map map) {
		return sal_PlanMapper.Sal_Chance_SelectCount(map);

	}

	public List<Sys_User> SelectUserName() {
		// TODO Auto-generated method stub
		return sal_PlanMapper.SelectUserName();
	}

	public Sal_Chance selectUserNameByid(int id) {
		// TODO Auto-generated method stub
		return sal_PlanMapper.selectUserNameByid(id);
	}

	public int Select_Sal_Chance_status() {
		// TODO Auto-generated method stub
		return sal_PlanMapper.Select_Sal_Chance_status();
	}
	public List<Sal_Plan> Sal_Plan_SelectByid(int id) {
		// TODO Auto-generated method stub
		return sal_PlanMapper.Sal_Plan_SelectByid(id);
	}
	public void Sal_Plan_Delete(int id) {
		// TODO Auto-generated method stub
		sal_PlanMapper.Sal_Plan_Delete(id);
		
	}

	public int Update_Sal_Plan(Sal_Plan sal_Plan) {
		// TODO Auto-generated method stub
		return sal_PlanMapper.Update_Sal_Plan(sal_Plan);
	}

	public int Sal_Plan_Insert(Sal_Plan sal_Plan) {
		// TODO Auto-generated method stub
		return sal_PlanMapper.Sal_Plan_Insert(sal_Plan);
	}

	public int updateStatus(Sal_Chance sal_Chance) {
		// TODO Auto-generated method stub
		return sal_PlanMapper.updateStatus(sal_Chance);
	}


}
