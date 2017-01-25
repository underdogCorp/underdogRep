package com.underdog.dao;

import javax.inject.Inject;

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
	public void registerProc(ReplyVO reply) {
		session.insert(namespace + ".registerProc", reply);
	}

}
