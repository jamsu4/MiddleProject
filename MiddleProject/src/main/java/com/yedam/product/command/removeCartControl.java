package com.yedam.product.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Command;
import com.yedam.product.service.ProductService;
import com.yedam.product.service.ProductServiceImpl;

public class removeCartControl implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String cartId = req.getParameter("cartId");
		
		ProductService service = new ProductServiceImpl();
		
		String json = "";
		
		if(service.removeCart(Integer.parseInt(cartId)) > 0) {
			json = "{\"retCode\": \"Success\"}";
		} else {
			json = "{\"retCode\": \"Fail\"}";
		}
		
		return json + ".json";
	}

}
