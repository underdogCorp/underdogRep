package com.underdog.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.underdog.controller.BoardController;
import com.underdog.dao.BoardDAO;
import com.underdog.domain.BoardVO;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Inject
	private BoardDAO dao;
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	
	@Override
	public List<BoardVO> list(String bo_bbsid) throws Exception {
		return dao.list(bo_bbsid);
	}
	
	
	@Override
	public void registerProc(HttpServletRequest req, BoardVO boardVO) throws Exception {
		
		logger.info("BoardServiceImpl - registerProc 입장");
		
		boardVO.setBo_regip(req.getRemoteAddr());
		dao.registerProc(boardVO);
		
	}

	@Override
	public BoardVO board_cont(HashMap data) throws Exception{
		return dao.board_cont(data);
	}



}
