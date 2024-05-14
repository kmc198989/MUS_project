package com.mus.model;

public class Criteria {

	// 현재 페이지 번호
	private int pageNum;
	
	// 페이지 표시 개수
	private int amount;
	
	// 검색 타입
	private String type;
	
	// 검색 키워드
	private String keyword = "";
	
	// 브랜드네임
	private String brandName;
	
	// 카테고리 코드
	private String cateCode;

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getBrandName() {
		return brandName;
	}

	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}

	public String getCateCode() {
		return cateCode;
	}

	public void setCateCode(String cateCode) {
		this.cateCode = cateCode;
	}

	@Override
	public String toString() {
		return "Criteria [pageNum=" + pageNum + ", amount=" + amount + ", type=" + type + ", keyword=" + keyword
				+ ", brandName=" + brandName + ", cateCode=" + cateCode + "]";
	}
	
	
}
