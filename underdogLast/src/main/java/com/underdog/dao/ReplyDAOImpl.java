package com.underdog.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.underdog.domain.ReplyVO;
import com.underdog.service.ReplyServiceImpl;

@Repository
public class ReplyDAOImpl implements ReplyDAO {

	@Inject
	private SqlSession session;

	private static String namespace = "com.underdog.mapper.replyMapper";
	
	private static final Logger logger = LoggerFactory.getLogger(ReplyDAOImpl.class);
	
	
	// 댓글 등록 프로세스
	@Override
	public void registerProc(ReplyVO replyVo) {
		logger.info("ReplyDAOImpl - registerProc 입장");
		session.insert(namespace + ".registerProc", replyVo);
	}
	
	// 댓글 리스트 불러오기
	@Override
	public List<ReplyVO> replyList(ReplyVO replyVo) {
		logger.info("ReplyDAOImpl - replyList 입장");
		
		return session.selectList(namespace + ".replyList", replyVo);
	}




}
