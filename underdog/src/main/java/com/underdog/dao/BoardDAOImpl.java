package com.underdog.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.underdog.controller.BoardController;
import com.underdog.domain.BoardVO;

@Repository
public class BoardDAOImpl implements BoardDAO {
	
	@Inject
	private SqlSession session;

	private static String namespace = "com.underdog.mapper.boardMapper";

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	// 게시판 리스트 불러오기
	@Override
	public List<BoardVO> list(String bo_bbsid) throws Exception {
		logger.info("BoardDAOImpl - list 입장");
	  return session.selectList(namespace + ".list", bo_bbsid);
	}

	// 게시글 등록
	@Override
	public void registerProc(BoardVO boardVO) {
		logger.info("BoardDAOImpl - registerProc 입장");
		int result = 0;
		
		result = session.insert(namespace + ".registerProc", boardVO);
		if(result == 1){
			
		}
	}

	// 상세보기 및 수정 폼
	@Override
	public BoardVO board_cont(HashMap data) throws Exception {
		logger.info("BoardDAOImpl - board_cont 입장");
		return (BoardVO)session.selectOne(namespace +".board_cont", data);
	}
	
	
	@Override
	public void delproc(Map data){
		session.update(namespace+"board_delproc",data);
	}
	

	// 게시글 수정
	@Override
	public void modifyProc(Map data) throws Exception {
		logger.info("BoardDAOImpl - modifyProc 입장");

		session.update(namespace + ".modifyProc", data);
	}


	
}
