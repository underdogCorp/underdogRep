package com.underdog.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.underdog.domain.BoardVO;

@Repository
public class BoardDAOImpl implements BoardDAO {
	
	@Inject
	private SqlSession session;

	private static String namespace = "com.underdog.mapper.boardMapper";

	@Override
	public void create(BoardVO vo) throws Exception {
		session.insert(namespace + ".create", vo);
	}

	  @Override
	  public List<BoardVO> list(String bbsid) throws Exception {
	    return session.selectList(namespace + ".list", bbsid);
	  }
	
	
}
