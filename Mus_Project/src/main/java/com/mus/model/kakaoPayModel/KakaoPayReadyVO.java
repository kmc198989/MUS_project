package com.mus.model.kakaoPayModel;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Data
public class KakaoPayReadyVO {
	
	private String tid; //결제 고유번호
	private String next_redirect_pc_url; //모바일웹일 경우 받는 결제페이지
	private String partner_order_id; //pc웹일경우 받는 결제 페이지
	private String created_at;
}
