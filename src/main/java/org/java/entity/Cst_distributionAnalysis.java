package org.java.entity;

/**
 * 客户分布分析
 */
public class Cst_distributionAnalysis {

	public String getCust_region() {
		return cust_region;
	}
	public void setCust_region(String cust_region) {
		this.cust_region = cust_region;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	private String cust_region;
	private int count;
}
