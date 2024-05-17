package com.mus.model;

public class SellerVO {
	private int sellerId, busineseNum, report;
	private String sellerCompany, brandName, brandCEO, tel, email, address;
	
	public int getSellerId() {
		return sellerId;
	}
	public void setSellerId(int sellerId) {
		this.sellerId = sellerId;
	}
	public int getBusineseNum() {
		return busineseNum;
	}
	public void setBusineseNum(int busineseNum) {
		this.busineseNum = busineseNum;
	}
	public int getReport() {
		return report;
	}
	public void setReport(int report) {
		this.report = report;
	}
	public String getSellerCompany() {
		return sellerCompany;
	}
	public void setSellerCompany(String sellerCompany) {
		this.sellerCompany = sellerCompany;
	}
	public String getBrandName() {
		return brandName;
	}
	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}
	public String getBrandCEO() {
		return brandCEO;
	}
	public void setBrandCEO(String brandCEO) {
		this.brandCEO = brandCEO;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}

	@Override
	public String toString() {
		return "SellerVO [sellerId=" + sellerId + ", busineseNum=" + busineseNum + ", report=" + report
				+ ", sellerCompany=" + sellerCompany + ", brandName=" + brandName + ", brandCEO=" + brandCEO + ", tel="
				+ tel + ", email=" + email + ", address=" + address + "]";
	}
}
