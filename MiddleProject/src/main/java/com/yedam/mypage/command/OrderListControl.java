package com.yedam.mypage.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.yedam.common.Command;
import com.yedam.order.service.OrderService;
import com.yedam.order.service.OrderServiceImpl;

public class OrderListControl implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		OrderService service = new OrderServiceImpl(); 		
		HttpSession session = req.getSession();
		String memId = (String) session.getAttribute("logId");
		System.out.println("logId:"+memId); //세션에서 id는 잘 받아옴
		System.out.println("OrderVO:"+service.myOrder((String) session.getAttribute("logId")));
		req.setAttribute("list",service.myOrder(memId));
		return "mypage/orderList.tiles";
	}

}
