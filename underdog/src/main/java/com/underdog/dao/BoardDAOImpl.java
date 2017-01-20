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
	
	@Override
	public List<BoardVO> list(String bo_bbsid) throws Exception {
	  return session.selectList(namespace + ".list", bo_bbsid);
	}

	@Override
	public void registerProc(BoardVO boardVO) {
		logger.info("BoardDAOImpl - registerProc 입장");
		
		session.insert(namespace + ".registerProc", boardVO);
		
	}
	@Override
	public List<BoardVO> read(Map data) throws Exception {
		return session.selectList(namespace +".read", data);
	}

	@Override
	public Object board_cont(HashMap data) {
		return session.selectList(namespace +".board_cont", data);
	}


	
}
