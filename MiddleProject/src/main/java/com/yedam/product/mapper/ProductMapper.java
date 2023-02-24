package com.yedam.product.mapper;

import java.util.List;

import com.yedam.product.vo.CartVO;
import com.yedam.product.vo.ProductVO;

public interface ProductMapper {
	// 목록, 단건조회.

	public List<ProductVO> getList(); //전체 상품 조회
	public List<ProductVO> searchResult(String keyword); //상품 검색
	public List<ProductVO> menuResult(String menu);
//	public ProductVO getProduct(String productCode);

	public ProductVO getProduct(int productId); // 제품 단건조회
	public int insertProductCart(CartVO cart); // 제품 카트에 추가

//	public List<ProductVO> relatedList();

	
}
