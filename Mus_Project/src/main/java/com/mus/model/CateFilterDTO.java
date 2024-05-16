package com.mus.model;

public class CateFilterDTO {

	// 카테고리 이름
	private String cateName;
	
	// 카테고리 넘버
	private String cateCode;
	
	// 카테고리 상품 수
	private int cateCount;
	

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

	public int getCateCount() {
		return cateCount;
	}

	public void setCateCount(int cateCount) {
		this.cateCount = cateCount;
	}

	@Override
	public String toString() {
		return "CateFilterDTO [cateName=" + cateName + ", cateCode=" + cateCode + ", cateCount=" + cateCount + "]";
	}
	
	
}
