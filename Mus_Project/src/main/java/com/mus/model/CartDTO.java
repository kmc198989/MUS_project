package com.mus.model;

public class CartDTO {
	
	private int cartId; 
    private String memberId;
    private int clothId;
    private int clothCount;
    
    //mus_cloth
    
    private String clothName;
    private int clothPrice;
    private double clothDiscount;
    
    // 추가
    private int salePrice;
    private int totalPrice;
	public int getCartId() {
		return cartId;
	}
	public void setCartId(int cartId) {
		this.cartId = cartId;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
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
	public int getTotalPrice() {
		return totalPrice;
	}
	public void initSaleTotal() {
		this.salePrice = (int) (this.clothPrice * (1-this.clothDiscount));
		this.totalPrice = this.salePrice*this.clothCount;
	}
	@Override
	public String toString() {
		return "CartDTO [cartId=" + cartId + ", memberId=" + memberId + ", clothId=" + clothId + ", clothCount="
				+ clothCount + ", clothName=" + clothName + ", clothPrice=" + clothPrice + ", clothDiscount="
				+ clothDiscount + ", salePrice=" + salePrice + ", totalPrice=" + totalPrice + "]";
	}
	

    
    
}
