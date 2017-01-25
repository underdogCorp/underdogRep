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
import com.underdog.domain.Criteria;
import com.underdog.domain.SearchCriteria;

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
		logger.info((String) data.get("state"));
		
		if(data.get("state").equals("read")) {
			session.update(namespace +".hit", data);
		}
		return (BoardVO)session.selectOne(namespace +".board_cont", data);
	}
	
	// 게시글 삭제
	@Override
	public void delproc(int bo_idx)	throws Exception{
		session.update(namespace+".board_delproc",bo_idx);
	}
	

	// 게시글 수정
	@Override
	public void modifyProc(Map data) throws Exception {
		logger.info("BoardDAOImpl - modifyProc 입장");
		logger.info(data.get("bo_idx").toString());
		logger.info(data.get("bo_title").toString());
		logger.info(data.get("bo_content").toString());
		session.update(namespace + ".modifyProc", data);
	}

	@Override
	public List<BoardVO> listCriteria(Criteria cri) throws Exception {
		
		return session.selectList(namespace + ".listCriteria", cri);
	}

	@Override
	public int listCountCriteria(Criteria cri) throws Exception {
		
		return session.selectOne(namespace + ".listCountCriteria", cri);
	}
	
	// faq 게시판 클릭한 글 정보 불러오기(선택한 글 하나만 정보 가져옴)
	@Override
	public BoardVO listFaq(Map data) throws Exception{
		
		return session.selectOne(namespace + ".board_cont", data);
	}

	
	// 게시판 리스트 불러오기 + 검색된 게시글 불러오기
	@Override
	public List<BoardVO> listSearchCriteria(SearchCriteria cri) throws Exception {
		logger.info("BoardDAOImpl - listSearchCriteria 입장");
		return session.selectList(namespace + ".listSearchCriteria", cri);
	}

	// 게시글 총 갯수 + 검색된 게시글 총 갯수
	@Override
	public int listSearchCount(SearchCriteria cri) throws Exception {
		logger.info("BoardDAOImpl - listSearchCount 입장");
		logger.info("DAO 갯수:" + session.selectOne(namespace + ".listSearchCount", cri));
		
		return session.selectOne(namespace + ".listSearchCount", cri);
	}




	
}
