package com.yedam.product.service;

import java.util.List;

import com.yedam.product.vo.CartVO;
import com.yedam.product.vo.ProductVO;

public interface ProductService {
	// 목록, 단건조회.

	public List<ProductVO> productList(); // 전체 상품 조회
	public List<ProductVO> searchProduct(String keyword); //상품 검색
	public List<ProductVO> searchMenu(String menu);
//	public ProductVO getProduct(String productCode);

	public ProductVO getProduct(int productId); //제품 단건조회
	public int addProductCart(CartVO cart); // 제품 카트에 추가
//	public List<ProductVO> productList();

//	public List<ProductVO> relateList();

	
}
