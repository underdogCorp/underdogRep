package com.underdog.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.underdog.dao.BoardDAO;
import com.underdog.domain.BoardVO;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Inject
	private BoardDAO dao;
	
	@Override
	public void regist(BoardVO board) throws Exception {
		
	}

	@Override
	public List<BoardVO> list(String bbsid) throws Exception {
		
		return null;
	}

}
