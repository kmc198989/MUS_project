package com.mus.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mus.model.CartDTO;
import com.mus.model.MemberVO;
import com.mus.service.CartService;

@Controller
public class CartController {
	private static final Logger logger = LoggerFactory.getLogger(CartController.class);

	@Autowired
	private CartService cartService;
	
	@PostMapping("/cart/add")
	@ResponseBody
	public String addCartPOST(CartDTO cart, HttpServletRequest request) {
		//로그인 체크
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO)session.getAttribute("member");
		if(mvo == null) {
			return "5";
		}
		
		//카트 등록
		int result = cartService.addCart(cart);
		return result + "";
	}
	
	@GetMapping("/cart/{memberId}")
	public String cartPageGET(@PathVariable("memberId") String memberId, Model model) {
		
		System.out.println("cartController + " + memberId);
		
		model.addAttribute("cartInfo", cartService.getCartList(memberId));
		
		return "/cart";
	}
	
	// 장바구니 수량 수정 
	@PostMapping("/cart/update")
	public String updateCartPOST(CartDTO cart) {
		
		cartService.modifyCount(cart);
		
		return "redirect:/cart/" + cart.getMemberId();
		
	}
	
	// 장바구니 삭제 
	@PostMapping("/cart/delete")
	public String deleteCartPOST(CartDTO cart) {
		logger.info("cart/delete 컨트롤러 cartdto 정보 : " + cart);
		
		cartService.deleteCart(cart.getCartId());
		
		return "redirect:/cart/" + cart.getMemberId();
		
	}
}
