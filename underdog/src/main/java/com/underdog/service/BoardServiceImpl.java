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
import com.underdog.domain.Criteria;
import com.underdog.domain.SearchCriteria;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Inject
	private BoardDAO dao;
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	// 게시판 리스트 불러오기
	@Override
	public List<BoardVO> list(String bo_bbsid) throws Exception {
		logger.info("BoardServiceImpl - list 입장");
		return dao.list(bo_bbsid);
	}
	
	// 게시글 등록
	@Override
	public void registerProc(HttpServletRequest req, BoardVO boardVO) throws Exception {
		
		logger.info("BoardServiceImpl - registerProc 입장");
		
		boardVO.setBo_regip(req.getRemoteAddr());
		dao.registerProc(boardVO);
		
	}

	// 상세보기 및 수정 폼 가기
	@Override
	public BoardVO board_cont(HashMap data) throws Exception{
		logger.info("BoardServiceImpl - board_cont 입장");
		
		return dao.board_cont(data);
	}
	

	//	게시글 삭제 
	@Override
	public void delProc(String bo_idx) throws Exception{
		logger.info("BoardServiceImpl- delproc 입장");
		dao.delproc(bo_idx);
	}
	

	// 게시글 수정
	@Override
	public void modifyProc(Map data) throws Exception{
		logger.info("BoardServiceImpl - modifyProc 입장");
		
		dao.modifyProc(data);
	}

	@Override
	public List<BoardVO> listCriteria(Criteria cri) throws Exception {

		return dao.listCriteria(cri);
  
	}

	@Override
	public int listCountCriteria(Criteria cri) throws Exception {
		
		return dao.listCountCriteria(cri);
	}

	@Override
	public List<BoardVO> listSearchCriteria(SearchCriteria cri) throws Exception {
		logger.info("BoardServiceImpl - listSearchCriteria 입장");
		return dao.listSearch(cri);
	}

	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		logger.info("BoardServiceImpl - listSearchCount 입장");
		return dao.listSearchCount(cri);
	}



}
