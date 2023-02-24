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
//		String proId = req.getParameter("proId");
//		String caQuant = req.getParameter("caQuant");
//		String caSumprice = req.getParameter("caSumprice");
//		
//		CartVO vo = new CartVO();
//		vo.setProId(Integer.parseInt(proId));
//		vo.setCaQuant(Integer.parseInt(caQuant));
//		vo.setCaSumprice(Integer.parseInt(caSumprice));
//		
//		ProductService service = new ProductServiceImpl();
//		service.addProductCart(vo);
//		
//		Gson gson = new GsonBuilder().create();
//		String json = gson.toJson(vo);
//		
//		return json + ".json";
		return null;
	}

}
