package com.underdog.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import com.underdog.domain.BoardVO;

public class BoardDAOImpl implements BoardDAO {
	@Inject
	private SqlSession session;

	private static String namespace = "com.underdog.mapper.boardMapper";

	@Override
	public void create(BoardVO vo) throws Exception {
		session.insert(namespace + ".create", vo);
	}
}
