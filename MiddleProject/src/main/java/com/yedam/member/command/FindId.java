package com.yedam.member.command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.yedam.common.Command;
import com.yedam.member.service.MemberService;
import com.yedam.member.service.MemberServiceMybatis;
import com.yedam.member.vo.MemberVO;

public class FindId implements Command {

	@Override
	public String exec(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		String name = req.getParameter("name");
		String email = req.getParameter("email");
		
		MemberService service = new MemberServiceMybatis();

		MemberVO fId = service.findId(name, email);
		
		// fId 가 뭔가를 반환받았다면(즉, 아이디를 받환받았다면)
		if(fId != null) {
			req.setAttribute("fId", fId.getMemId());
			return "member/findIdResult.tiles";
		} else {
			// 에러 메시지 출력 후 다시 findIdForm화면으로
			req.setAttribute("error", "아이디가 없는데요");
			return "member/findIdForm.tiles";	
		}
	}
}