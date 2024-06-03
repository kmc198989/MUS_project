package com.mus.model;

import java.util.Date;
import java.util.List;

public class ClothVO {
	private int clothId, sellerId, clothPrice, clothStock, ratingCount, likes;
	private double ratingAvg;
	private String clothName, brandName, publeYear, cateCode, cateName, clothIntro, clothContents;
	private double clothDiscount;
	private int discountedPrice; // 계산 및 출력용(DB에 없음)
	private int finalPrice; // 계산 및 출력용(DB에 없음)
	private Date regDate, updateDate;
	private List<AttachImageVO> imageList;

	
	
	public int getLikes() {
		return likes;
	}

	public void setLikes(int likes) {
		this.likes = likes;
	}

	public int getRatingCount() {
		return ratingCount;
	}

	public void setRatingCount(int ratingCount) {
		this.ratingCount = ratingCount;
	}

	public double getRatingAvg() {
		return ratingAvg;
	}

	public void setRatingAvg(double ratingAvg) {
		this.ratingAvg = ratingAvg;
	}

	public int getDiscountedPrice() {
		return discountedPrice;
	}

	public void setDiscountedPrice(int discountedPrice) {
		this.discountedPrice = discountedPrice;
	}

	public int getFinalPrice() {
		return finalPrice;
	}

	public void setFinalPrice(int finalPrice) {
		this.finalPrice = finalPrice;
	}

	public int getClothId() {
		return clothId;
	}

	public void setClothId(int clothId) {
		this.clothId = clothId;
	}

	public int getSellerId() {
		return sellerId;
	}

	public void setSellerId(int sellerId) {
		this.sellerId = sellerId;
	}

	public int getClothPrice() {
		return clothPrice;
	}

	public void setClothPrice(int clothPrice) {
		this.clothPrice = clothPrice;
	}

	public int getClothStock() {
		return clothStock;
	}

	public void setClothStock(int clothStock) {
		this.clothStock = clothStock;
	}

	public String getClothName() {
		return clothName;
	}

	public void setClothName(String clothName) {
		this.clothName = clothName;
	}

	public String getBrandName() {
		return brandName;
	}

	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}

	public String getPubleYear() {
		return publeYear;
	}

	public void setPubleYear(String publeYear) {
		this.publeYear = publeYear;
	}

	public String getCateCode() {
		return cateCode;
	}

	public void setCateCode(String cateCode) {
		this.cateCode = cateCode;
	}

	public String getCateName() {
		return cateName;
	}

	public void setCateName(String cateName) {
		this.cateName = cateName;
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

	public double getClothDiscount() {
		return clothDiscount;
	}

	public void setClothDiscount(double clothDiscount) {
		this.clothDiscount = clothDiscount;
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

	public List<AttachImageVO> getImageList() {
		return imageList;
	}

	public void setImageList(List<AttachImageVO> imageList) {
		this.imageList = imageList;
	}

	@Override
	public String toString() {
		return "ClothVO [clothId=" + clothId + ", sellerId=" + sellerId + ", clothPrice=" + clothPrice + ", clothStock="
				+ clothStock + ", ratingCount=" + ratingCount + ", likes=" + likes + ", ratingAvg=" + ratingAvg
				+ ", clothName=" + clothName + ", brandName=" + brandName + ", publeYear=" + publeYear + ", cateCode="
				+ cateCode + ", cateName=" + cateName + ", clothIntro=" + clothIntro + ", clothContents="
				+ clothContents + ", clothDiscount=" + clothDiscount + ", discountedPrice=" + discountedPrice
				+ ", finalPrice=" + finalPrice + ", regDate=" + regDate + ", updateDate=" + updateDate + ", imageList="
				+ imageList + "]";
	}
}
