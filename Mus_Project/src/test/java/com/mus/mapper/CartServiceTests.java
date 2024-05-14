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
public class CartServiceTests {
	
	@Autowired
	private CartService service;
	
	//등록 테스트
		@Test
		public void addCartTest() {
			//given
				String memberId = "test";
				int clothId = 7;
				int count = 2;
				
				CartDTO dto = new CartDTO(); 
				dto.setMemberId(memberId);
				dto.setClothId(clothId);
				dto.setClothCount(count);
			
			//when
				int result = service.addCart(dto);
			
			//then
				System.out.println("** result : " + result);
			
			
		}
}
