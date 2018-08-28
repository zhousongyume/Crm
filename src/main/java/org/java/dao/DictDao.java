package org.java.dao;

import java.util.List;
import java.util.Map;

import org.java.entity.Bas_Dict;

public interface DictDao {
	/*
	 * 模糊查询
	 */
	public List<Bas_Dict> selectBasDict(Map map);
	/*
	 * 模糊查询总条数
	 */
	public Long selectBasDictCount(Map map);
	/*
	 * 删除
	 */
	public void dalete(Long id);
	/*
	 * 根据类别查询
	 */
	public List<Bas_Dict> selectBasDictJihui(String dict_type);
}
