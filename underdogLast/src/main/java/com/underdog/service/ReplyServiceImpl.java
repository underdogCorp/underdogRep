package com.underdog.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.underdog.dao.ReplyDAO;
import com.underdog.domain.ReplyVO;

@Service
public class ReplyServiceImpl implements ReplyService {

	@Inject
	private ReplyDAO dao;
	
	private static final Logger logger = LoggerFactory.getLogger(ReplyServiceImpl.class);
	
	// 댓글 등록 프로세스
	@Override
	public void registerProc(HashMap date) {
		logger.info("BoardServiceImpl - registerProc 입장");
		
		dao.registerProc(date);
	}

	
	// 댓글 리스트 불러오기 
	@Override
	public List<ReplyVO> reply_cont(HashMap data) {
		logger.info("BoardServiceImpl - registerProc 입장");
		
		return dao.replyList(data);
	}









}
