package com.mus.service;


import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.mus.mapper.CartMapper;
import com.mus.model.CartDTO;
import com.mus.model.MemberVO;
import com.mus.model.kakaoPayModel.KakaoPayApprovalVO;
import com.mus.model.kakaoPayModel.KakaoPayReadyVO;
import com.mus.util.SessionUtil;

import lombok.extern.java.Log;

@Service
@Log
public class KakaoPayService {
	
	@Autowired
	private CartMapper cartMapper;
	
	// payReady
	public KakaoPayReadyVO payReady(int totalAmount) {
		
        HttpSession session = SessionUtil.getSession();
        MemberVO vo = (MemberVO) session.getAttribute("member");
		//MemberVO vo = (MemberVO)SessionUtil.getSession().getAttribute("memberId");
		System.out.println("kakaoPayReadyVO payReady() vo 객체 " + vo);
		List<CartDTO> carts = cartMapper.getCart(vo.getMemberId());
		
		String[] cartsNames = new String[carts.size()];
		for(CartDTO cart: carts) {
			for(int i=0; i<carts.size(); i++) {
				cartsNames[i] = cart.getClothName();
			}
		}
		String itemName = cartsNames[0] + "그 외" + (carts.size()-1);
		log.info("주문 이름들 : " + itemName);
		String order_id = vo.getMemberId() + itemName;
		
		// 카카오가 요구한 결제요청request값을 담아줍니다. 
			MultiValueMap<String, String> parameters = new LinkedMultiValueMap<String, String>();
			parameters.add("cid", "TC0ONETIME");
			parameters.add("partner_order_id", order_id);
			parameters.add("partner_user_id", "kmc");
			parameters.add("item_name", itemName);
			parameters.add("quantity", String.valueOf(carts.size()));
			parameters.add("total_amount", String.valueOf(totalAmount));
			parameters.add("tax_free_amount", "0");
			parameters.add("approval_url", "http://localhost:8080/order/kakaoPaySuccess"); // 결제승인시 넘어갈 url
			parameters.add("cancel_url", "http://localhost:8080/order/cancel"); // 결제취소시 넘어갈 url
			parameters.add("fail_url", "http://localhost:8080/order/fail"); // 결제 실패시 넘어갈 url
			
			log.info("파트너 주문 아이디: " + parameters.get("partner_order_id"));
			HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<>(parameters, this.getHeaders());
			RestTemplate template = new RestTemplate();
			String url = "https://kapi.kakao.com/v1/payment/ready";
			KakaoPayReadyVO readyResponse = template.postForObject(url, requestEntity, KakaoPayReadyVO.class);
			log.info("결재준비 응답객체 : " + readyResponse);
			
			return readyResponse;
			
		}
	
		public KakaoPayApprovalVO payApprove(String tid, String pgToken) {
			HttpSession session = SessionUtil.getSession();
	        MemberVO vo = (MemberVO) session.getAttribute("member");
			
			List<CartDTO> carts = cartMapper.getCart(vo.getMemberId());
			
			String[] cartsNames = new String[carts.size()];
			for(CartDTO cart: carts) {
				for(int i=0; i<carts.size(); i++) {
					cartsNames[i] = cart.getClothName();
				}
			}
			String itemName = cartsNames[0] + "그 외" + (carts.size()-1);
			
			String order_id = vo.getMemberId() + itemName;
			
			// request값 담기.
			MultiValueMap<String, String> parameters = new LinkedMultiValueMap<String, String>();
			parameters.add("cid", "TC0ONETIME");
			parameters.add("tid", tid);
			parameters.add("partner_order_id", order_id); // 주문명
			parameters.add("partner_user_id", "kmc");
			parameters.add("pg_token", pgToken);
			
	        // 하나의 map안에 header와 parameter값을 담아줌.
			HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<>(parameters, this.getHeaders());
			
			// 외부url 통신
			RestTemplate template = new RestTemplate();
			String url = "https://kapi.kakao.com/v1/payment/approve";
			KakaoPayApprovalVO approveResponse = template.postForObject(url, requestEntity, KakaoPayApprovalVO.class);
			log.info("결재승인 응답객체 : " + approveResponse);
			
			return approveResponse;
		}
			
			
			// header() 셋팅
		private HttpHeaders getHeaders() {
			
			HttpHeaders headers = new HttpHeaders();
			headers.set("Authorization", "KakaoAK e8c84c98558452dab477586ba910d1b8");
			headers.set("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
				
			return headers;
		}

}

