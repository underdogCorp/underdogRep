package com.underdog.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.underdog.domain.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Inject
	private SqlSession session;

	private static String namespace = "com.underdog.mapper.memberMapper";

	@Override
	public int joinCheckEmail(String s) throws Exception {
		// TODO Auto-generated method stub
		return session.selectOne(namespace + ".joinCheckEmail", s);
	}

	@Override
	public int joinProc(MemberVO mbVO) throws Exception {

		return session.insert(namespace + ".joinProc", mbVO);
	}

	@Override
	public MemberVO loginProc(MemberVO mbVO) throws Exception {

		return session.selectOne(namespace + ".loginProc", mbVO);
	}
}
