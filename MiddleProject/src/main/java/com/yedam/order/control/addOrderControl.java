package com.yedam.order.control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Command;
import com.yedam.order.service.OrderService;
import com.yedam.order.service.OrderServiceImpl;
import com.yedam.order.vo.OrderVO;

public class addOrderControl implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String memId = req.getParameter("memId");
		String ordStatus = req.getParameter("ordStatus");
		String ordReceiver = req.getParameter("ordReceiver");
		String ordAddr = req.getParameter("ordAddr");
		String ordPhone = req.getParameter("ordPhone");
		String ordPostcode = req.getParameter("ordPostcode");
		String ordTotalPrice = req.getParameter("ordTotalPrice");
		
		OrderVO ovo = new OrderVO();
		ovo.setMemId(memId);
		ovo.setOrdStatus(ordStatus);
		ovo.setOrdReceiver(ordReceiver);
		ovo.setOrdAddr(ordAddr);
		ovo.setOrdPhone(ordPhone);
		ovo.setOrdPostcode(ordPostcode);
		ovo.setOrdTotalprice(Integer.parseInt(ordTotalPrice));
		
		OrderService service = new OrderServiceImpl();
		
		if(service.addOrder(ovo)>0) {
			return "order/orderComplete.tiles";
		} else {
			return "order/orderFail.tiles";
		}
		
		
		
		
	}

}
