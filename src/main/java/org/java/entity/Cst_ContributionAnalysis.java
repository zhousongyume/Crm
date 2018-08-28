package org.java.entity;
/**
 * 客户贡献分析实体类
 */
public class Cst_ContributionAnalysis {

	private String odr_type;//订单类型
	public String getOdr_type() {
		return odr_type;
	}
	public void setOdr_type(String odr_type) {
		this.odr_type = odr_type;
	}
	public Double getOdr_cost() {
		return odr_cost;
	}
	public void setOdr_cost(Double odr_cost) {
		this.odr_cost = odr_cost;
	}
	private Double odr_cost;//贡献金钱 
}
