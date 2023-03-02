package com.yedam.product.command;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.common.Command;
import com.yedam.product.service.ProductService;
import com.yedam.product.service.ProductServiceImpl;
import com.yedam.product.vo.ProductVO;

public class ModifyReviewManage implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String rid = req.getParameter("rid");
		String rReply = req.getParameter("rReply");
		
		ProductVO vo = new ProductVO();
		vo.setRevId(Integer.parseInt(rid));
		vo.setRevReply(rReply);
		
		Map<String, Object> resultMap = new HashMap<>();
		resultMap.put("review", vo);
		Gson gson = new GsonBuilder().create();
		
		ProductService service = new ProductServiceImpl();
		
		System.out.println(service.updateReview(vo));
		
		if(service.updateReview(vo) > 0) {
			resultMap.put("retCode", "Success");
		} else {
			resultMap.put("retCode", "Fail");
		}
		
		return gson.toJson(resultMap) + ".json";
	}

}
