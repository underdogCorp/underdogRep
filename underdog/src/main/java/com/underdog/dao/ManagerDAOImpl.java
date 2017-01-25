package com.underdog.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.underdog.domain.MemberVO;

@Repository
public class ManagerDAOImpl implements ManagerDAO{
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.underdog.mapper.ManagerMapper";

	@Override
	public List<MemberVO> members() {
		
		return session.selectList(namespace+".membersAll");
	}

}
