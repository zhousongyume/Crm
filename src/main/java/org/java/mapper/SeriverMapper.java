package org.java.mapper;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.java.entity.Sct_Service;

public interface SeriverMapper {
	

    /**
     * 查询所有服务信息
     * @param map   参数集合
     * @return      返回服务信息列表
     */
    List<Sct_Service> selectSctAll(Map map);

    /**
     * 查询服务信息条数
     * @param map  参数集合
     * @return     返回服务信息条数
     */
    Long selectSctCount(Map map);

    /**
     * 添加服务信息
     * @param map   参数集合
     */
    void addSct(Map map);

    /**
     * 根据服务编号查询服务信息
     * @param id   服务编号
     * @return     返回服务信息对象
     */
    Sct_Service selectSctById(Long id);

    /**
     * 修改服务信息
     * @param map 参数数组
     */
    void updateSct(Map map);

    /**
     * 根据服务编号删除服务信息
     * @param id   服务编号
     */
    void delSct(Long id);
    /*
     * 按编号查询用户
     */
    String userById(long user_id);
    
    /**
     * 修改服务的处理信息
     * @param map 参数数组
     */
    void updateSeriverchu(Map map);
    /**
	 * 客户服务视图查询条数
	 */
	public Integer selectCusServiceAnalysisCount(@Param("svr_create_date")Date svr_create_date,@Param("svr_create_date1")Date svr_create_date1,@Param("svr_type")String svr_type);

}
