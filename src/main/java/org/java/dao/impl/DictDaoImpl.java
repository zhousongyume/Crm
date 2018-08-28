package org.java.dao.impl;

import java.util.List;
import java.util.Map;

import org.java.dao.DictDao;
import org.java.entity.Bas_Dict;
import org.java.mapper.DictMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
public class DictDaoImpl implements DictDao {
	@Autowired
	private DictMapper dictmapper;
	
	@Override
	public List<Bas_Dict> selectBasDict(Map map) {
		// TODO Auto-generated method stub
		return dictmapper.selectBasDict(map);
	}
	@Override
	public Long selectBasDictCount(Map map) {
		// TODO Auto-generated method stub
		return dictmapper.selectBasDictCount(map);
	}

	@Override
	public void dalete(Long id) {
		dictmapper.dalete(id);
	}
	@Override
	public List<Bas_Dict> selectBasDictJihui(String dict_type) {
		return dictmapper.selectBasDictJihui(dict_type);
	}

}
