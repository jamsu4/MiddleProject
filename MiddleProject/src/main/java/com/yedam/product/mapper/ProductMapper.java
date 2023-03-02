package com.yedam.product.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.mypage.vo.ZzimVO;
import com.yedam.product.vo.ProductVO;

public interface ProductMapper {
	// 목록, 단건조회.

	public List<ProductVO> getList(); //전체 상품 조회
	public List<ProductVO> searchResult(String keyword); //상품 검색
	public List<ProductVO> menuResult(String menu);

	public ProductVO getProduct(int productId); // 제품 단건조회
	public int insertProductCart(ProductVO cart); // 제품 카트에 추가
	public int addZzimList(ZzimVO vo); // 찜하기
	public List<ProductVO> selectCartList(String logId); //카트 목록 조회

	public int deleteProduct(int proId); // 제품 삭제
	public int updateProduct(ProductVO product); // 제품 수정
	public int insertProduct(ProductVO product); // 제품 등록
	public int deleteCart(int cartId); //장바구니 제거
	
	
	public List<ProductVO> getReviewList(int proId); // 리뷰 리스트
	public List<ProductVO> getManageReviewList(); // 관리자 리뷰 리스트
	public int deleteReview(int revId); // 리뷰 삭제
	public int updateReview(ProductVO review); // 리뷰 수정
	public List<ProductVO> searchReviewList(@Param("memId") String memId, @Param("proId") String proId); // 리뷰 검색
	
}
