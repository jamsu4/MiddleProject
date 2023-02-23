package com.yedam.order.vo;

import lombok.Data;

@Data
public class OrderVO {
	private int orderId;
	private int MemberId;
	private String OrderReceiver;
	private String OrderAddr;
	private String OrderPhone;
	private String OrderStatus;
	private int totalPrice;
}
