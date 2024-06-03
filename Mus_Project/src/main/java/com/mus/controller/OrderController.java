package com.mus.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mus.mapper.OrderMapper;
import com.mus.model.MemberVO;
import com.mus.model.OrderDTO;
import com.mus.model.OrderPageDTO;
import com.mus.model.kakaoPayModel.KakaoPayApprovalVO;
import com.mus.model.kakaoPayModel.KakaoPayReadyVO;
import com.mus.model.kakaoPayModel.Payment;
import com.mus.service.KakaoPayService;
import com.mus.service.MemberService;
import com.mus.service.OrderService;

import lombok.extern.java.Log;

@Controller
@Log
public class OrderController {

	@Autowired
	private OrderService orderService;

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private OrderMapper ordermapper;
	
	@Autowired
	private KakaoPayService kakaoService;

	@GetMapping("/order/{memberId}")
	public String orderPgaeGET(@PathVariable("memberId") String memberId, OrderPageDTO opd, Model model) {

		model.addAttribute("orderList", orderService.getGoodsInfo(opd.getOrders()));
		model.addAttribute("memberInfo", memberService.getMemberInfo(memberId));

		return "/order";

	}

	@PostMapping("/order")
	public String orderPagePost(OrderDTO od, HttpServletRequest request) {

		System.out.println(od);

		orderService.order(od);
		
		MemberVO member = new MemberVO();
		member.setMemberId(od.getMemberId());
		
		HttpSession session = request.getSession();

		try {
			MemberVO memberLogin = memberService.memberLogin(member);
			memberLogin.setMemberPw("");
			session.setAttribute("member", memberLogin);

		} catch (Exception e) {

			e.printStackTrace();
		}

		return "redirect:/main";
	}
	
	/* 카카오페이 결제 요청 */
	@GetMapping("/order/kakaoPay")
	@ResponseBody
	public KakaoPayReadyVO payReady(@RequestParam(name="total_amount") int totalAmount, OrderDTO order, Model model) {
		log.info("주문정보: " + order);
		log.info("주문가격: " + totalAmount);
		
		//카카오페이 결제 준비하기 - 결제요청 Service 실행.
		KakaoPayReadyVO readyResponse = kakaoService.payReady(totalAmount);
		
		//요청처리후 받아온 결재 고유 번호(tid)를 모델에 저장
		model.addAttribute("tid", readyResponse.getTid());
		log.info("결재고유 번호: " + readyResponse.getTid());
		
		//Order정보를 모델에 저장
		model.addAttribute("order", order);
		
		return readyResponse; //클라이언트에 전송(tid, next_redirect_pc_url 포함)
	}
	
	/* 결제 승인 요청 */
	@GetMapping("/order/kakaoPaySuccess")
	public String paySuccess(@RequestParam("pg_token") String pgToken,
							@ModelAttribute("tid") String tid,
							@ModelAttribute("order") OrderDTO order, Model model) {
		
		log.info("결제승인 요청을 인증하는 토큰 : " + pgToken);
		log.info("주문 정보: " + order);
		log.info("결재고유 번호: " + tid);
		
		//카카오 결재 요청하기
		KakaoPayApprovalVO approveResponse = kakaoService.payApprove(tid, pgToken);
		
		
		//카카오페이로 넘겨받은 결재정보값을 저장함.
		Payment payment = Payment.builder()
						.paymentClassName(approveResponse.getItem_name())
						.payMathod(approveResponse.getPayment_method_type())
						.payCode(tid)
						.build();
		
		ordermapper.saveOrder(payment);
		
		return "redirect:/order";
	}

}
