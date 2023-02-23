package com.yedam.order.mapper;

import java.util.List;

import com.yedam.order.vo.OrderVO;



public interface OrderMapper {
	// 목록, 단건조회.
	public List<OrderVO> getList();
	public OrderVO getOrder(String productCode);
	
}
