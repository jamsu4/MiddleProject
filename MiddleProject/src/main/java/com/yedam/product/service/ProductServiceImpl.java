package com.yedam.product.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedam.common.DataSource;
import com.yedam.mypage.vo.ZzimVO;
import com.yedam.product.mapper.ProductMapper;
import com.yedam.product.vo.ProductVO;

public class ProductServiceImpl implements ProductService{
	SqlSession session = DataSource.getInstance().openSession(true);
	ProductMapper mapper = session.getMapper(ProductMapper.class);

	
	@Override
	public List<ProductVO> productList() {
		return mapper.getList();
	}

	@Override
	public List<ProductVO> searchProduct(String keyword) {
		return mapper.searchResult(keyword);
	}

	@Override
	public ProductVO getProduct(int productId) {
		return mapper.getProduct(productId);
	}
	@Override
	public int addProductCart(ProductVO cart) {
		return mapper.insertProductCart(cart);
	}

	@Override
	public List<ProductVO> searchMenu(String menu) {
		return mapper.menuResult(menu);
	}

	@Override

	public int addZzim(ZzimVO vo) {
		return mapper.addZzimList(vo);
	}

	@Override
	public List<ProductVO> getCartList(String logId) {
		return mapper.selectCartList(logId);
	}
	public int removeProduct(int proId) {
		return mapper.deleteProduct(proId);
	}

	@Override
	public int modifyProduct(ProductVO product) {
		return mapper.updateProduct(product);

	}

	
}
