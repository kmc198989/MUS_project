package com.mus.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mus.kakaopay.ReadyResponse;
import com.mus.model.CartDTO;
import com.mus.model.MemberVO;
import com.mus.model.OrderVO;
import com.mus.model.PaymentVO;
import com.mus.service.KakaoPayServiceImpl;
import com.mus.service.MemberService;
import com.mus.service.OrderService;

@RequestMapping("/korder/*")
@Controller
public class KakaoOrderController {

	@Autowired
	private OrderService orderService;

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private KakaoPayServiceImpl kakaoPayServiceImpl;

	/*
	@GetMapping("/orderPay")
	public @ResponseBody ReadyResponse payReady(OrderVO o_vo, PaymentVO p_vo, int totalAmount, HttpSession session, Model model) {
		
		String mem_id = ((MemberVO)session.getAttribute("member")).getMemberId();
		
		// 장바구니 내역 불러오기
		//List<CartDTO> cartList = orderService.getGoodsInfo(opd.getOrders()); 
	}
	*/
}
