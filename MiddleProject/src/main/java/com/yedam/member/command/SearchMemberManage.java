package com.yedam.member.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.yedam.common.Command;
import com.yedam.member.service.MemberService;
import com.yedam.member.service.MemberServiceMybatis;
import com.yedam.member.vo.MemberVO;

public class SearchMemberManage implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String memId = req.getParameter("memId");
		
		System.out.println("출력 테스트 컨트롤러 -> " + memId);

		if(memId.equals("")) {
			memId = null;
		}
		
		MemberService service = new MemberServiceMybatis();
		
		MemberVO serachMember = service.searchMember(memId);
		
		Gson gson = new GsonBuilder().create();

		return gson.toJson(serachMember) + ".json";
	}

}
