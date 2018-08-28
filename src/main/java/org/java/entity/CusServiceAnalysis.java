package org.java.entity;

/**
 * 客户服务分析图表实体类
 */
public class CusServiceAnalysis {

	private String  svr_type;//服务类型
	private Integer count;//每个季度不同类型服务人数
	private String quarter;//季度
	public String getSvr_type() {
		return svr_type;
	}
	public void setSvr_type(String svr_type) {
		this.svr_type = svr_type;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	public String getQuarter() {
		return quarter;
	}
	public void setQuarter(String quarter) {
		this.quarter = quarter;
	}
}
