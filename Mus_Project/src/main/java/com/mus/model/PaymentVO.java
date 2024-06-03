package com.mus.model;

import java.util.Date;

import lombok.Data;

@Data
public class PaymentVO {

	private Integer pay_code;		// 일련번호 관리
	private Long odr_code;			// 주문번호
	private String pay_method;		// 결제방식 선택
	private Date pay_date;			// 결제일
	private int pay_tot_price;		// 결제금액
	private int pay_rest_price;		// 미지급금
	private String pay_nobank_user;	// 입금자명(무통장)
	private String pay_nobank;		// 입금 은행
}
