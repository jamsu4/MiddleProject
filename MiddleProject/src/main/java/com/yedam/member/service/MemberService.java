package com.yedam.member.service;

import com.yedam.member.vo.MemberVO;

// MemberMapper.java 에서 선언한 것들을(기본적인 부분) 이용하여 응용할 수 있는 부분
public interface MemberService { // 서비스 부분

	public MemberVO login(MemberVO member);
}