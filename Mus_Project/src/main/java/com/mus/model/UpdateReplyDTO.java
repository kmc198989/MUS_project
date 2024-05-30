package com.mus.model;

public class UpdateReplyDTO {

	private int clothId;
	
	private double ratingAvg;

	public int getClothId() {
		return clothId;
	}

	public void setClothId(int clothId) {
		this.clothId = clothId;
	}

	public double getRatingAvg() {
		return ratingAvg;
	}

	public void setRatingAvg(double ratingAvg) {
		this.ratingAvg = ratingAvg;
	}

	@Override
	public String toString() {
		return "UpdateReplyDTO [clothId=" + clothId + ", ratingAvg=" + ratingAvg + "]";
	}
	
	
}
