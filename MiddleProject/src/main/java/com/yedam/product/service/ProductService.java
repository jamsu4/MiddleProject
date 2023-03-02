package com.yedam.product.service;

import java.util.List;

import com.yedam.mypage.vo.ZzimVO;
import com.yedam.product.vo.ProductVO;

public interface ProductService {
	// 목록, 단건조회.

	public List<ProductVO> productList(); // 전체 상품 조회
	public List<ProductVO> searchProduct(String keyword); //상품 검색
	public List<ProductVO> searchMenu(String menu);
//	public ProductVO getProduct(String productCode);

	public ProductVO getProduct(int productId); //제품 단건조회
	public int addProductCart(ProductVO cart); // 제품 카트에 추가
//	public List<ProductVO> productList();
	public int addZzim(ZzimVO vo); //찜 목록 추가
	public List<ProductVO> getCartList(String logId); // 카트 목록 가져오기

//	public List<ProductVO> relateList();


	public int removeProduct(int proId); // 제품 삭제
	public int modifyProduct(ProductVO product); // 제품 수정
	public int addProduct(ProductVO product); // 제품 등록
	public int removeCart(int cartId); // 장바구니 제거
	
	
	
	public List<ProductVO> getReviewList(int proId); // 리뷰 리스트
	
}
