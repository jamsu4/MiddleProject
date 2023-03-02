
package com.yedam.order.service;

import java.util.List;

import com.yedam.order.vo.OrderVO;

public interface OrderService { 
	public List<OrderVO> orderList(); // 목록

	public OrderVO getOrder(String orderId);

	public int addOrder(OrderVO ovo);	//orders정보 추가

	public int addPayment(OrderVO ovo); //payment정보 추가

	public int addOrderProduct(List<OrderVO> opList); //구매 상품 정보

}
