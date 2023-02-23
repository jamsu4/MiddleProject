package com.yedam.product.vo;

import lombok.Data;

@Data
public class ProductVO {
	private int productID;
	private String productName;
	private int productPrice;
	private String productDesc;
	private String productCategory;
	private String image;
}
