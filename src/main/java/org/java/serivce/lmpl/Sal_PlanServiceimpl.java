package org.java.serivce.lmpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.java.dao.Sal_ChanceDao;
import org.java.dao.Sal_PlanDao;
import org.java.dao.impl.Sal_PlanDaoImpl;
import org.java.entity.Sal_Chance;
import org.java.entity.Sal_Plan;
import org.java.entity.Sys_User;
import org.java.serivce.Sal_ChanceService;
import org.java.serivce.Sal_PlanService;
import org.java.utils.ConstSystem;
import org.java.utils.Pages;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class Sal_PlanServiceimpl implements Sal_PlanService {
	@Autowired
	private Sal_PlanDao  sal_PlanDao;

	public Sal_PlanDao getSal_PlanDao() {
		return sal_PlanDao;
	}

	public void setSal_PlanDao(Sal_PlanDao sal_PlanDao) {
		this.sal_PlanDao = sal_PlanDao;
	}

	public List<Sys_User> SelectUserName() {
		// TODO Auto-generated method stub
		return sal_PlanDao.SelectUserName();
	}


	public Sal_Chance selectUserNameByid(int id) {
		// TODO Auto-generated method stub
		return sal_PlanDao.selectUserNameByid(id);
	}

	public int Select_Sal_Chance_status() {
		// TODO Auto-generated method stub
		return sal_PlanDao.Select_Sal_Chance_status();
	}

	public List<Sal_Plan> Sal_Plan_SelectByid(int id) {
		// TODO Auto-generated method stub
		return sal_PlanDao.Sal_Plan_SelectByid(id);
	}

	public void Sal_Plan_Delete(int id) {
		// TODO Auto-generated method stub
		sal_PlanDao.Sal_Plan_Delete(id);
	}


	public int Update_Sal_Plan(Sal_Plan sal_Plan) {
		// TODO Auto-generated method stub
		return sal_PlanDao.Update_Sal_Plan(sal_Plan);
	}


	public int Sal_Plan_Insert(Sal_Plan sal_Plan) {
		// TODO Auto-generated method stub
		return sal_PlanDao.Sal_Plan_Insert(sal_Plan);
	}

	public int updateStatus(Sal_Chance sal_Chance) {
		// TODO Auto-generated method stub
		return sal_PlanDao.updateStatus(sal_Chance);
	}

	@Override
	public Pages<Sal_Chance> Sal_ChancePage(String now, String size, String chc_cust_name, String chc_title,
			String chc_linkman) {
		Pages<Sal_Chance> page=new Pages<Sal_Chance>();
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
        map.put("chc_cust_name",chc_cust_name);
        map.put("chc_title",chc_title);
        map.put("chc_linkman",chc_linkman);
        Long count=sal_PlanDao.Sal_Chance_SelectCount(map);
        page.setCount(count);
        Long pageCount=count%pageSize==0?(count/pageSize):(count/pageSize)+1;
        page.setPageCount(pageCount);
        List<Sal_Chance> list =sal_PlanDao.Sal_Chance_Select(map);
        page.setList(list);
        return page;
	}

}
