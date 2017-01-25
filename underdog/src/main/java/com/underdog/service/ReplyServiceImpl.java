package com.underdog.service;

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
	public void registerProc(HttpServletRequest req, ReplyVO replyVO) {
		logger.info("BoardServiceImpl - registerProc 입장");
		
		replyVO.setRe_regip(req.getRemoteAddr());
		dao.registerProc(replyVO);
	}

}
