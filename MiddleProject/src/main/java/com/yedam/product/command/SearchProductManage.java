package com.yedam.product.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.common.Command;
import com.yedam.product.service.ProductService;
import com.yedam.product.service.ProductServiceImpl;
import com.yedam.product.vo.ProductVO;

public class SearchProductManage implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String proId = req.getParameter("proId");
		String proName = req.getParameter("proName");
		if(proId.equals("")) {
			proId = null;
		}
		if(proName.equals("")) {
			proName = null;
		}
		ProductService service = new ProductServiceImpl();

		List<ProductVO> searchReview = service.searchProductList(proId, proName);

		Gson gson = new GsonBuilder().create();

		return gson.toJson(searchReview) + ".json";
	}

}
