package com.mus.model.kakaoPayModel;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class Payment {
	
	private int orderNo;  //오더아이디
	private String payMathod; //결제방식
	private String payCode; //결제코드
	private String paymentClassName; //상품명
}
