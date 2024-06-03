package com.mus.service;

import java.util.List;

import com.mus.model.OrderCancelDTO;
import com.mus.model.OrderDTO;
import com.mus.model.OrderPageItemDTO;

public interface OrderService {
	
	/* 주문 정보 */
	public List<OrderPageItemDTO> getGoodsInfo(List<OrderPageItemDTO> orders);
	
	/* 주문 */
	public void  order(OrderDTO ord);
	
	/* 주문 취소 */
	public void orderCancle(OrderCancelDTO dto);
}
