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

public class ReplyList implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
//		String revId = req.getParameter("revId");
//		
//		ProductService service = new ProductServiceImpl();
//		System.out.println(service.replyList(Integer.parseInt(revId)));
//		List<ProductVO> reList = service.replyList(Integer.parseInt(revId));
//		Gson gson = new GsonBuilder().create();
//		String json = gson.toJson(reList);
//		
//		return json + ".json";
		return null;
	}

}
