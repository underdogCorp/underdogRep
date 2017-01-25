package com.underdog.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ManagerDAOImpl {
	
	@Inject
	private SqlSession session;
	
	private static String namespace = "com.underdog.mapper.ManagerMapper";

}
