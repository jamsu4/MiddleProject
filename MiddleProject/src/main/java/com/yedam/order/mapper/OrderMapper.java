
package com.yedam.order.mapper;

import java.util.List;

import com.yedam.order.vo.OrderVO;

public interface OrderMapper { 
	public OrderVO getOrder(String productCode);// 단건조회.
	
	public int insertOrder(OrderVO ovo); // 주문정보 추가

	public List<OrderVO> getOrderList(); // 주문정보 전체 조회

	public int insertPayment(OrderVO ovo); //지불정보 추가
}
