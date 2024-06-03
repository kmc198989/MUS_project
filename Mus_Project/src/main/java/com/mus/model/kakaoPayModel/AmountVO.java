package com.mus.model.kakaoPayModel;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class AmountVO {
	
	private int total;
	private int tax_free;
	private int vat;
	private int point;
	private int discount;
}
