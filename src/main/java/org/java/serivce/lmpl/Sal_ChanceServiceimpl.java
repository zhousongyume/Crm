package org.java.serivce.lmpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.java.dao.Sal_ChanceDao;
import org.java.entity.Sal_Chance;
import org.java.entity.Sys_User;
import org.java.serivce.Sal_ChanceService;
import org.java.utils.ConstSystem;
import org.java.utils.Pages;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Transactional
public class Sal_ChanceServiceimpl implements Sal_ChanceService {
	@Autowired
	private Sal_ChanceDao  sal_ChanceDao;
	public Sal_ChanceDao getSal_ChanceDao() {
		return sal_ChanceDao;
	}

	public void setSal_ChanceDao(Sal_ChanceDao sal_ChanceDao) {
		this.sal_ChanceDao = sal_ChanceDao;
	}

	public void Sal_Chance_Insert(Sal_Chance chance) {
		// TODO Auto-generated method stub
		sal_ChanceDao.Sal_Chance_Insert(chance);
		
	}
	public void Sal_chance_Update(Sal_Chance chance) {
		// TODO Auto-generated method stub
		sal_ChanceDao.Sal_chance_Update(chance);
	}


	public List<Sys_User> SelectUserName() {
		// TODO Auto-generated method stub
		return sal_ChanceDao.SelectUserName();
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
        Long count=sal_ChanceDao.Sal_Chance_SelectCount(map);
        page.setCount(count);
        Long pageCount=count%pageSize==0?(count/pageSize):(count/pageSize)+1;
        page.setPageCount(pageCount);
        List<Sal_Chance> list =sal_ChanceDao.Sal_Chance_Select(map);
        page.setList(list);
        return page;
	}

	@Override
	public Sal_Chance selectUserNameByid(Long chc_due_id) {
			// TODO Auto-generated method stub
			return sal_ChanceDao.selectUserNameByid(chc_due_id);
	}

	@Override
	public void Sal_chance_Delete(Long usr_id) {
		// TODO Auto-generated method stub
		sal_ChanceDao.Sal_chance_Delete(usr_id);
	}


}
