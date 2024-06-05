package com.mus.mapper;

import java.util.List;

import com.mus.model.ClothVO;
import com.mus.model.MemberVO;
import com.mus.model.OrderDTO;
import com.mus.model.OrderItemDTO;
import com.mus.model.OrderPageItemDTO;
import com.mus.model.kakaoPayModel.Payment;

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
	
	/* 주문 취소 */
	public int orderCancle(String orderId);
	
	/* 주문 상품 정보(주문취소) */
	public List<OrderItemDTO> getOrderItemInfo(String orderId);
	
	/* 주문 정보(주문취소) */
	public OrderDTO getOrder(String orderId);
	
	/* 카카오페이 saveOrder */
	public void saveOrder(Payment payment);
	
	/* 카카오페이 상품 이름 */
	public String getGoodsName(int clothId);
}
