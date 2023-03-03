
package com.yedam.order.service;

import java.util.List;

import com.yedam.order.vo.OrderVO;

public interface OrderService { // 목록, 단건조회.
	public List<OrderVO> orderList();

	public OrderVO getOrder(String orderId);

	public int addOrder(OrderVO ovo);

	public List<OrderVO> myOrder(String memId); //mypage주문내역출력

}
