package org.java.dao.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.java.dao.Sct_ServiceDao;
import org.java.entity.Sct_Service;
import org.java.mapper.SeriverMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class Sct_ServiceDaoImpl implements Sct_ServiceDao{
	@Autowired
	private SeriverMapper seriverMapper;
	
	public SeriverMapper getSeriverMapper() {
		return seriverMapper;
	}
	public void setSeriverMapper(SeriverMapper seriverMapper) {
		this.seriverMapper = seriverMapper;
	}

	    public List<Sct_Service> selectSctAll(Map map) {
	        return seriverMapper.selectSctAll(map);
	    }

	
	    public Long selectSctCount(Map map) {
	        return seriverMapper.selectSctCount(map);
	    }


	    public void addSct(Map map) {
	    	seriverMapper.addSct(map);
	    }


	    public Sct_Service selectSctById(Long id) {
	        return seriverMapper.selectSctById(id);
	    }


	    public void updateSct(Map map) {
	    	seriverMapper.updateSct(map);
	    }

	    public void delSct(Long id) {
	    	seriverMapper.delSct(id);
	    }
		
		public String userById(long user_id) {
			// TODO Auto-generated method stub
			return seriverMapper.userById(user_id);
		}
	
		public void updateSeriverchu(Map map) {
			// TODO Auto-generated method stub
			seriverMapper.updateSeriverchu(map);
		}
		@Override
		public Integer selectCusServiceAnalysisCount(Date svr_create_date, Date svr_create_date1, String svr_type) {
			// TODO Auto-generated method stub
			return seriverMapper.selectCusServiceAnalysisCount(svr_create_date, svr_create_date1, svr_type);
		}
	
}
