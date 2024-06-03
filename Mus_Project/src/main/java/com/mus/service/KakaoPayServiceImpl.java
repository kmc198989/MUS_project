package com.mus.service;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.mus.kakaopay.ReadyResponse;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class KakaoPayServiceImpl {

	/* 
	카카오 Pay API에 요청하기 위한 작업
	1) HttpURLConnection을 이용한 HTTP 통신
	2) Rest Template를 이용한 통신(권장) : https://minkwon4.tistory.com/178
	 */
	
	/* 
	 * 첫번째 요청주소
		POST /online/v1/payment/ready HTTP/1.1
		Host: open-api.kakaopay.com
		Authorization: SECRET_KEY ${SECRET_KEY}
		Content-Type: application/json
	 */
	public ReadyResponse payReady(String itemName, int quantity, String mem_id, int totalAmount) {
		
		String order_id = "100";
		
		// 카카오페이에 요청할 request 정보 구성작업
		// 컬렉션 클래스를 이용하여 구성한다.
		// Map 컬렉션 : 하나의 키에 값만 저장하는 특징.
		// Map<String, String> map = new LinkedHashMap<String, String>();
		
		// 하나의 키에 여러개의 값을 저장하는 특징. 스프링에서 제공
		MultiValueMap<String, String> parameters = new LinkedMultiValueMap<String, String>();
		parameters.add("cid", "");
		parameters.add("partner_order_id", order_id);
		parameters.add("partner_user_id", mem_id);
		parameters.add("item_name", itemName);
		parameters.add("quantity", String.valueOf(quantity));
		parameters.add("total_amount", String.valueOf(totalAmount));
		parameters.add("tax_free_amount", "0");
		parameters.add("approval_url", "http://localhost:8080/order/orderApp");
		parameters.add("cancel_url", "http://localhost:8080/order/orderCancel");
		parameters.add("fail_url", "http://localhost:8080/order/orderFail");

		// HttpEntity<T> : HttpHeader, HttpBody를 포함하는 특징.
		// HttpEntity<T> 클래스를 상속받아 구현한 클래스가 있다. RequestEntity, Responseentity
		// ResponseEntity 클래스 : HttpHeader, HttpBody, HttpStatus 3가지 정보를 관리
		
		// 헤더와 파라미터 정보를 구성.
		HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<MultiValueMap<String,String>>(parameters, this.getHeader());
		
		// 외부API와 통신
		RestTemplate template = new RestTemplate();
		
		// 1차 요청 주소
		String url = "https://open-api.kakaopay.com/online/v1/payment/ready";
		
		ReadyResponse readyResponse = template.postForObject(url, requestEntity, ReadyResponse.class);

		return readyResponse;
	}
	
	// 요청 헤더 정보
	private HttpHeaders getHeader() {
		HttpHeaders headers = new HttpHeaders();
		headers.set("Authorization", "SECRET_KEY DEV30B8AC30FF181CB47A45789E78514ECC9EEDC");
		headers.set("Content-type", "application/json");
		
		return headers;
	}
	
		
}
