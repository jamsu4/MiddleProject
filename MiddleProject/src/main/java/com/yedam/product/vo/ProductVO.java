package com.yedam.product.vo;

import lombok.Data;

@Data
public class ProductVO {
	private int proId;
	private String proName;
	private int proPrice;
	private String proDesc;
	private String proCategory;
	private String proImg;
	private int cartId;
	private String memId;
	private int caQuant;
	private int caSumprice;
}
