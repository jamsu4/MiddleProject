package com.yedam.order.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Command;
import com.yedam.order.service.OrderService;
import com.yedam.order.service.OrderServiceImpl;

public class orderManageControl implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		OrderService service = new OrderServiceImpl();
		req.setAttribute("orderList", service.orderList());
		System.out.println(service.orderList());
		return "admin/orderManage.tiles";
	}

}
