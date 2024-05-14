package com.mus.model;

import java.util.Date;

public class ClothVO {

	private int clothId;
	private String clothName;
	private int sellerId;
	private Date publeYear;
	private String brandName;
	private String cateCode;
	private int clothPrice;
	private int clothDiscount;
	private String clothIntro;
	private String clothContents;
	private Date regDate;
	private Date updateDate;
	
	
	public int getClothId() {
		return clothId;
	}
	public void setClothId(int clothId) {
		this.clothId = clothId;
	}
	public String getClothName() {
		return clothName;
	}
	public void setClothName(String clothName) {
		this.clothName = clothName;
	}
	public int getSellerId() {
		return sellerId;
	}
	public void setSellerId(int sellerId) {
		this.sellerId = sellerId;
	}
	public Date getPubleYear() {
		return publeYear;
	}
	public void setPubleYear(Date publeYear) {
		this.publeYear = publeYear;
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
	public int getClothPrice() {
		return clothPrice;
	}
	public void setClothPrice(int clothPrice) {
		this.clothPrice = clothPrice;
	}
	public int getClothDiscount() {
		return clothDiscount;
	}
	public void setClothDiscount(int clothDiscount) {
		this.clothDiscount = clothDiscount;
	}
	public String getClothIntro() {
		return clothIntro;
	}
	public void setClothIntro(String clothIntro) {
		this.clothIntro = clothIntro;
	}
	public String getClothContents() {
		return clothContents;
	}
	public void setClothContents(String clothContents) {
		this.clothContents = clothContents;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	
	
	@Override
	public String toString() {
		return "ClothVO [clothId=" + clothId + ", clothName=" + clothName + ", sellerId=" + sellerId + ", publeYear="
				+ publeYear + ", brandName=" + brandName + ", cateCode=" + cateCode + ", clothPrice=" + clothPrice
				+ ", clothDiscount=" + clothDiscount + ", clothIntro=" + clothIntro + ", clothContents=" + clothContents
				+ ", regDate=" + regDate + ", updateDate=" + updateDate + "]";
	}
	
	
	
}
