package com.yedam.order.vo;

import lombok.Data;

@Data
public class OrderVO {
	private int ordId;
	private String memId;
	private String ordReceiver;
	private String ordAddr;
	private String ordPhone;
	private String ordStatus;
	private int ordTotalprice;
	private String ordPostcode;
	// orderproduct table
	private int ordProId;
	private int ordQuant;
	private int proId;
	private int ordProSumprice;
	//payment
	private int payId;
	private String payDate;
	private int payTotalprice;
	private int payCouponprice;
	private String payCode;
	private int coupId;
	
	private String memName;
	private String proName;
	//검색조건
	
}
