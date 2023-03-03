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
	private int proid;
	private int ordProSumprice;
	//주문내역용 product table,payment table
	private String proName;
	private String proImg;
	private String payDate;
	private int proPrice;
	
}
