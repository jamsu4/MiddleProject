package com.yedam.product.service;

import java.util.List;

import com.yedam.product.vo.ProductVO;

public interface ProductService {
	// 목록, 단건조회.
	public List<ProductVO> productList(); // 전체 상품 조회
	public List<ProductVO> searchProduct(String keyword); //상품 검색
//	public ProductVO getProduct(String productCode);
//	public List<ProductVO> relateList();

	
}
