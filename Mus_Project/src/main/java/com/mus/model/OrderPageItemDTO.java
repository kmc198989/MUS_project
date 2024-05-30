package com.mus.model;

import java.util.List;

public class OrderPageItemDTO {
	
	/* 뷰로 전달 받을 값*/
	private int clothId;
	private int clothCount;
	
	/* DB로부터 꺼내올 값 */
	private String clothName;
	private int clothPrice;
	private double clothDiscount;
	
	/* 만들어 낼 값 */
	private int salePrice;
	private int totalPrice;
	private int point;
	private int totalPoint;
	
	/* 상품 이미지 */
	private List<AttachImageVO> imageList;
	
	public int getClothId() {
		return clothId;
	}
	public void setClothId(int clothId) {
		this.clothId = clothId;
	}
	public int getClothCount() {
		return clothCount;
	}
	public void setClothCount(int clothCount) {
		this.clothCount = clothCount;
	}
	public String getClothName() {
		return clothName;
	}
	public void setClothName(String clothName) {
		this.clothName = clothName;
	}
	public int getClothPrice() {
		return clothPrice;
	}
	public void setClothPrice(int clothPrice) {
		this.clothPrice = clothPrice;
	}
	public double getClothDiscount() {
		return clothDiscount;
	}
	public void setClothDiscount(double clothDiscount) {
		this.clothDiscount = clothDiscount;
	}
	public int getSalePrice() {
		return salePrice;
	}
	public void setSalePrice(int salePrice) {
		this.salePrice = salePrice;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public int getTotalPoint() {
		return totalPoint;
	}
	public void setTotalPoint(int totalPoint) {
		this.totalPoint = totalPoint;
	}
	
	public void initSaleTotal() {
		this.salePrice = (int) (this.clothPrice * (1-this.clothDiscount));
		this.totalPrice = this.salePrice*this.clothCount;
		this.point = (int)(Math.floor(this.salePrice*0.05));
		this.totalPoint =this.point * this.clothCount;
	}
	
	public List<AttachImageVO> getImageList() {
		return imageList;
	}

	public void setImageList(List<AttachImageVO> imageList) {
		this.imageList = imageList;
	}
	
	@Override
	public String toString() {
		return "OrderPageItemDTO [clothId=" + clothId + ", clothCount=" + clothCount + ", clothName=" + clothName
				+ ", clothPrice=" + clothPrice + ", clothDiscount=" + clothDiscount + ", salePrice=" + salePrice
				+ ", totalPrice=" + totalPrice + ", point=" + point + ", totalPoint=" + totalPoint + ", imageList="
				+ imageList + "]";
	}
	
	
}

