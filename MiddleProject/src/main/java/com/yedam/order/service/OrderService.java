package com.yedam.order.service;

import java.util.List;

import com.yedam.order.vo.OrderVO;
import com.yedam.product.vo.ProductVO;

public interface OrderService {
	// 목록, 단건조회.
	public List<OrderVO> orderList();
	public OrderVO getOrder(String orderId);
	
}
