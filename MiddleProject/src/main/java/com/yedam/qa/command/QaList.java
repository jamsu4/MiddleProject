package com.yedam.qa.command;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.common.Command;
import com.yedam.qa.service.QaService;
import com.yedam.qa.service.QaServiceImpl;
import com.yedam.qa.vo.QaVO;

public class QaList implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		QaService service = new QaServiceImpl();
		List<QaVO> qaListAll = service.qaListAll();
		
		Gson gson = new GsonBuilder().create();
		
		return gson.toJson(qaListAll) + ".json";
	}

}
