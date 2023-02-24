package com.yedam.product.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.common.Command;
import com.yedam.product.service.ProductService;
import com.yedam.product.service.ProductServiceImpl;
import com.yedam.product.vo.CartVO;

public class ProductCartAdd implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String memId = req.getParameter("memId");
		String proId = req.getParameter("proId");
		String caQuant = req.getParameter("caQuant");
		String caSumprice = req.getParameter("caSumprice");
		
		CartVO vo = new CartVO();
		vo.setMemId(memId);
		vo.setProId(Integer.parseInt(proId));
		vo.setCaQuant(Integer.parseInt(caQuant));
		vo.setCaSumprice(Integer.parseInt(caSumprice));
		
		ProductService service = new ProductServiceImpl();
		String json = "";
		
		if(service.addProductCart(vo) > 0) {
			json = "{\"retCode\": \"Success\"}";
		} else {
			json = "{\"retCode\": \"Fail\"}";
		}
		
		return json + ".json";

	}

}
