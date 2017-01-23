package com.underdog.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.underdog.controller.BoardController;
import com.underdog.domain.MemberVO;

@Repository
public class MyPageDAOImpl implements MyPageDAO {

	@Inject
	private SqlSession session;
	private static String namespace = "com.underdog.mapper.mypageMapper";

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	// 마이페이지 회원 정보 보기
	@Override
	public MemberVO memberInfo(String me_email) throws Exception {
		logger.info("mypageDAOImpl - 회원정보불러오기 입장");
		return session.selectOne(namespace + ".memberInfo", me_email);
	}

}
