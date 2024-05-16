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
		return "CateVO [cateName=" + cateName + ", cateCode=" + cateCode + ", cateParent=" + cateParent + "]";
	}
	
	
}
