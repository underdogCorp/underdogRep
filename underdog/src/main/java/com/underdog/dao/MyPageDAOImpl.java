package com.underdog.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.underdog.controller.MyPageController;
import com.underdog.domain.BoardVO;
import com.underdog.domain.MemberVO;

@Repository
public class MyPageDAOImpl implements MyPageDAO {

	@Inject
	private SqlSession session;
	private static String namespace = "com.underdog.mapper.mypageMapper";

	private static final Logger logger = LoggerFactory.getLogger(MyPageController.class);

	// 마이페이지 회원 정보 보기
	@Override
	public MemberVO memberInfo(String me_email) throws Exception {
		logger.info("mypageDAOImpl - 회원정보불러오기 입장");
		return session.selectOne(namespace + ".memberInfo", me_email);
	}

	// 마이페이지 회원정보 보기전 pw체크
	@Override
	public int pwcheck(String me_email, String me_pw) throws Exception {
		int result = 0;
		MemberVO member;
		logger.info("mypageDAOImpl- 회원정보 보기전 pw체크 입장");
		member = (MemberVO) session.selectOne(namespace + ".memberInfo", me_email);
		System.out.println("입력한 email값:" + me_email);
		System.out.println("select한 email값:" + member.getMe_email());
		System.out.println("select한 me_pw값:" + member.getMe_pw());

		 if (!member.getMe_pw().equals(me_pw)) {
			result = -1;
		} else if (member.getMe_pw().equals(me_pw)) {
			result = 1;
		}

		return result;
	}

	// 마이페이지 회원정보 수정하기
	@Override
	public void modifyProc(HashMap data) {
		 session.update(namespace + ".modifyProc", data);
	}

	@Override
	public List<BoardVO> myboardInfo(String me_email) throws Exception {
			
		return session.selectList(namespace+".myboardList",me_email);
	}

}
