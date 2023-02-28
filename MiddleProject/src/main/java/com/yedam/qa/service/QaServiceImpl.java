package com.yedam.qa.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.yedam.common.DataSource;
import com.yedam.qa.mapper.QaMapper;
import com.yedam.qa.vo.QaVO;

public class QaServiceImpl implements QaService{
	SqlSession session = DataSource.getInstance().openSession(true);
	QaMapper mapper = session.getMapper(QaMapper.class);
	
	@Override
	public List<QaVO> qaList(int proId) {
		return mapper.getList(proId);
	}

	@Override
	public int addProductQa(QaVO qa) {
		return mapper.insertProductQa(qa);
	}
}
