package com.yedam.order.control;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Command;
import com.yedam.order.service.OrderService;
import com.yedam.order.service.OrderServiceImpl;
import com.yedam.order.vo.OrderVO;

public class addOrderProductControl implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String[] ordQuants = req.getParameterValues("ordQuant");
		String[] proIds = req.getParameterValues("proId");
		String[] ordProSumprices = req.getParameterValues("ordProSumprice");
		System.out.println(ordQuants);
		System.out.println(proIds);
		System.out.println(ordProSumprices);
		
		List<OrderVO> opList = new ArrayList<>();
		
		for(int i = 0 ; i < ordQuants.length ; i++) {
			OrderVO ovo = new OrderVO();
			ovo.setOrdQuant(Integer.parseInt(ordQuants[i])); 
			ovo.setProId(Integer.parseInt(proIds[i])); 
			ovo.setOrdProSumprice(Integer.parseInt(ordProSumprices[i])); 
			opList.add(ovo); 
		}
		System.out.println(opList);
		OrderService service = new OrderServiceImpl();
		System.out.println(service.addOrderProduct(opList));
		String json="";
			
		if(service.addOrderProduct(opList)>0) {
			json = "{\"retCode\": \"Success\"}";
		} else {
			json = "{\"retCode\": \"Fail\"}";
			
		}
		
		return json + ".json";
	}

}
