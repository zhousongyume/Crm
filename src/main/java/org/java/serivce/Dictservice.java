package org.java.serivce;

import java.util.List;
import java.util.Map;

import org.java.entity.Bas_Dict;
import org.java.utils.Pages;


public interface Dictservice {
	/*
	 * 分页查询
	 */
	Pages<Bas_Dict> selectUserPage(String now,String size,String dict_type,String dict_item,String  dict_value);
	/*
	 * 删除
	 */                                                             
	public void dalete(Long id);
	/*
	 * 根据类别查询
	 */
	public List<Bas_Dict> selectBasDictJihui(String dict_type);
}
