package com.yedam.product.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Command;
import com.yedam.product.service.ProductService;
import com.yedam.product.service.ProductServiceImpl;

public class ProductDetail implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String pid = req.getParameter("pid");
		ProductService service = new ProductServiceImpl();
		req.setAttribute("proDetail", service.getProduct(Integer.parseInt(pid)));
		System.out.println(service.getProduct(Integer.parseInt(pid)));
		
		return "product/productDetail.tiles";
	}

}
