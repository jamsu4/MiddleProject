package com.yedam.product.vo;

import lombok.Data;

@Data
public class CartVO {
	private int cartId;
	private String memId;
	private int proId;
	private int caQuant;
	private int caSumprice;
}
