package com.yedam.order.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Command;
import com.yedam.order.service.OrderService;
import com.yedam.order.service.OrderServiceImpl;
import com.yedam.order.vo.OrderVO;

public class updateOrderStatusControl implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String ordId = req.getParameter("ordId");
		String ordStauts = req.getParameter("ordStauts");
		String proId = req.getParameter("proId");
		
		OrderVO ovo = new OrderVO();
		ovo.setOrdId(Integer.parseInt(ordId));
		ovo.setOrdStatus(ordStauts);
		ovo.setOrdId(Integer.parseInt(proId));
		
		OrderService service = new OrderServiceImpl();
		service.modifyOrderStatus(ovo);
		
		return null;
	}

}
