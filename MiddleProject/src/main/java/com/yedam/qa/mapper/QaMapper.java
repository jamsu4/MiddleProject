package com.yedam.qa.mapper;

import java.util.List;

import com.yedam.qa.vo.QaVO;


public interface QaMapper {
	public List<QaVO> getList(int proId); // 제품 상세페이지 Q&A 목록 출력
	public int insertProductQa(QaVO qa); // Q&A 등록
}
