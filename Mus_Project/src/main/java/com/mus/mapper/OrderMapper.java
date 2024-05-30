package com.mus.mapper;

import com.mus.model.CartDTO;
import com.mus.model.ClothVO;
import com.mus.model.MemberVO;
import com.mus.model.OrderDTO;
import com.mus.model.OrderItemDTO;
import com.mus.model.OrderPageItemDTO;

public interface OrderMapper {
	
	/* 주문 상품 정보 */
	public OrderPageItemDTO getGoodsInfo(int clothId);
	
	/* 주문 상품 정보(주문 처리) */	
	public OrderItemDTO getOrderInfo(int clothId);
	
	/* 주문 테이블 등록 */
	public int enrollOrder(OrderDTO ord);
	
	/* 주문 아이템 테이블 등록 */
	public int enrollOrderItem(OrderItemDTO orid);
	
	/* 주문 금액 차감 */
	public int deductMoney(MemberVO member);
	
	/* 주문 재고 차감 */
	public int deductStock(ClothVO cloth);
}
