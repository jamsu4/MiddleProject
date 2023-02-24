package com.yedam.product.service;

import java.util.List;

import com.yedam.product.vo.CartVO;
import com.yedam.product.vo.ProductVO;

public interface ProductService {
	// 목록, 단건조회.
	public ProductVO getProduct(int productId); //제품 단건조회
	public int addProductCart(CartVO cart); // 제품 카트에 추가
//	public List<ProductVO> productList();
//	public List<ProductVO> relateList();
}
