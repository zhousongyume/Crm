package org.java.serivce.lmpl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.java.dao.Sal_ChanceDao;
import org.java.dao.Sct_ServiceDao;
import org.java.dao.impl.Sct_ServiceDaoImpl;
import org.java.entity.Sal_Chance;
import org.java.entity.Sct_Service;
import org.java.entity.Sys_User;
import org.java.serivce.Sal_ChanceService;
import org.java.serivce.Sal_PlanService;
import org.java.serivce.Sct_ServiceService;
import org.java.utils.ConstSystem;
import org.java.utils.Pages;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class Sct_ServiceServiceimpl implements Sct_ServiceService {
	@Autowired
	private Sct_ServiceDaoImpl  sct_ServiceDao;
    public Pages<Sct_Service> selectSctPage(String now, String size,
     String svr_cust_name, String svr_title, String svr_type, String svr_create_date, String svr_create_date1, String svr_result) {
        Pages<Sct_Service> page=new Pages<Sct_Service>();
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
        map.put("svr_cust_name",svr_cust_name);
        map.put("svr_title",svr_title);
        map.put("svr_type",svr_type);
        map.put("svr_create_date",svr_create_date);
        map.put("svr_create_date1",svr_create_date1);
        map.put("svr_result",svr_result);
        Long count=sct_ServiceDao.selectSctCount(map);
        page.setCount(count);
        Long pageCount=count%pageSize==0?(count/pageSize):(count/pageSize)+1;
        page.setPageCount(pageCount);
        List<Sct_Service> list = sct_ServiceDao.selectSctAll(map);
        page.setList(list);
        return page;
    }


    public void addSct(Map map) {
    	sct_ServiceDao.addSct(map);
    }


    public Sct_Service selectSctById(Long id) {
        return sct_ServiceDao.selectSctById(id);
    }


    public void updateSct(Map map) {
    	sct_ServiceDao.updateSct(map);
    }


    public void delSct(Long id) {
    	sct_ServiceDao.delSct(id);
    }


	@Override
	public String userById(long user_id) {
		// TODO Auto-generated method stub
		return sct_ServiceDao.userById(user_id);
	}


	@Override
	public void updateSeriverchu(Map map) {
		// TODO Auto-generated method stub
		sct_ServiceDao.updateSeriverchu(map);
	}


	@Override
	public Integer selectCusServiceAnalysisCount(Date svr_create_date, Date svr_create_date1, String svr_type) {
		// TODO Auto-generated method stub
		return sct_ServiceDao.selectCusServiceAnalysisCount(svr_create_date, svr_create_date1, svr_type);
	}

}
