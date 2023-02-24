package com.yedam.product.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.jasper.tagplugins.jstl.core.Set;

import com.yedam.common.Command;
import com.yedam.product.service.ProductService;
import com.yedam.product.service.ProductServiceImpl;

public class searchProductControl implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String keyword = req.getParameter("search");
		System.out.println(keyword);
		ProductService service = new ProductServiceImpl();
		req.setAttribute("list", service.searchProduct(keyword)); 
		System.out.println(service.searchProduct(keyword));
		
		return "search/search.tiles";
	}

}
