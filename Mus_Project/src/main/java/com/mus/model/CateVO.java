package com.mus.model;

public class CateVO {

	/*
	 * create table mus_cate ( cateName varchar2(30) not null, cateCode varchar2(30)
	 * not null, cateParent varchar2(30), primary key(cateCode), foreign
	 * key(cateParent) references mus_cate(cateCode) );
	 * 
	 * 
	 */

	private String cateName;
	private String cateCode;
	private String cateParent;
	private int count;	// 추가 되었음
	
	
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}


	private int tier;
	
	
	public int getTier() {
		return tier;
	}
	public void setTier(int tier) {
		this.tier = tier;
	}
	public String getCateName() {
		return cateName;
	}
	public void setCateName(String cateName) {
		this.cateName = cateName;
	}
	public String getCateCode() {
		return cateCode;
	}
	public void setCateCode(String cateCode) {
		this.cateCode = cateCode;
	}
	public String getCateParent() {
		return cateParent;
	}
	public void setCateParent(String cateParent) {
		this.cateParent = cateParent;
	}
	
	
	@Override
	public String toString() {
		return "CateVO [cateName=" + cateName + ", cateCode=" + cateCode + ", cateParent=" + cateParent + ", count="
				+ count + ", tier=" + tier + "]";
	}
	
	
}
