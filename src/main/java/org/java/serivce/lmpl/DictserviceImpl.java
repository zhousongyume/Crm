package org.java.serivce.lmpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.java.dao.DictDao;
import org.java.entity.Bas_Dict;
import org.java.serivce.Dictservice;
import org.java.utils.ConstSystem;
import org.java.utils.Pages;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DictserviceImpl implements Dictservice {
	@Autowired
	private DictDao dictdao;

	public Pages<Bas_Dict> selectUserPage(String now, String size, String dict_type, String dict_item, String  dict_value) {
		Pages<Bas_Dict> page=new Pages<Bas_Dict>();
		Long pageNow=1L;
		if(now!=null) {
			pageNow=Long.parseLong(now);
		}
		page.setPageNow(pageNow);
		Long pageSize= ConstSystem.PAGE_SIZE;
		if(size!=null) {
			pageSize=Long.parseLong(size);
		}
		page.setPageSize(pageSize);
		Map map=new HashMap();
		map.put("dict_type", dict_type);
		map.put("dict_item", dict_item);
		map.put("dict_value", dict_value);
		map.put("pageNow", pageNow);
		map.put("pageSize", pageSize);
		Long count=dictdao.selectBasDictCount(map);
		page.setCount(count);
		Long pageCount=count%pageSize==0?(count/pageSize):(count/pageSize)+1;
		page.setPageCount(pageCount);
		List<Bas_Dict> list = dictdao.selectBasDict(map);
		page.setList(list);
		return page;
	}

	

	@Override
	public void dalete(Long id) {
		dictdao.dalete(id);
	}



	@Override
	public List<Bas_Dict> selectBasDictJihui(String dict_type) {
		return dictdao.selectBasDictJihui(dict_type);
	}
	
	

}
