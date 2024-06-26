package com.mus.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.mus.model.CartDTO;
import com.mus.service.CartService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class CartMapperTests {
	
	
	@Autowired
	private CartService service;
	
	
	@Test
	public void addCart() throws Exception {
		// given
		String memberId = "kmc";
		int clothId = 315;
		int count = 2;
		
		CartDTO cart = new CartDTO();
		cart.setMemberId(memberId);
		cart.setClothId(clothId);
		cart.setClothCount(count);
		// when
		int result = service.addCart(cart);
		//then
		System.out.println("결과 : " + result);
		
	}
	
	/* 카트 삭제 

	@Test
	public void deleteCartTest() {
		int cartId = 1;
		
		mapper.deleteCart(cartId);
	}
	
	/* 카트 수량 수정 
	@Test
	public void modifyCartTest() {
		int cartId = 3;
		int count = 5;
		
		CartDTO cart = new CartDTO();
		cart.setCartId(cartId);
		cart.setClothCount(count);
		
		mapper.modifyCount(cart);
		
	}
	@Test
	public void getCartTest() {
		String memberId = "admin";
		
		List<CartDTO> list = mapper.getCart(memberId);
		for(CartDTO cart : list) {
			System.out.println(cart);
			cart.initSaleTotal();
			System.out.println("init cart : " + cart);
		}
	
	}
	
	/* 카트 확인 

	@Test
	public void checkCartTest() {
		
		String memberId = "admin";
		int bookId = 71;
		
		CartDTO cart = new CartDTO();
		cart.setMemberId(memberId);
		cart.setClothId(bookId);
		
		CartDTO resultCart = mapper.checkCart(cart);
		System.out.println("결과 : " + resultCart);
		
	}
	*/
	
}
