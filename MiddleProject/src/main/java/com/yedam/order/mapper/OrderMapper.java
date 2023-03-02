
package com.yedam.order.mapper;

import com.yedam.order.vo.OrderVO;

public interface OrderMapper { // 목록, 단건조회. public List<OrderVO> getList();
	public OrderVO getOrder(String productCode);

	public int insertOrder(OrderVO ovo); // 주문정보 추가
	
	public OrderVO myOrder(String memId); //mypage 주문내역
}
