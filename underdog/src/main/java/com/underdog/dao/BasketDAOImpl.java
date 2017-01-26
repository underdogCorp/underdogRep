package com.underdog.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.underdog.controller.BasketController;
import com.underdog.domain.BasketVO;

@Repository
public class BasketDAOImpl implements BasketDAO {

	@Inject
	private SqlSession session;
	private static String namespace = "com.underdog.mapper.basketMapper";
	
	private static final Logger logger = LoggerFactory.getLogger(BasketController.class);
	
	@Override
	public List<BasketVO> basket(String me_email) throws Exception {
		logger.info("BasketDAOImpl - 장바구니 리스트 불러오기 입장");
		return session.selectList(namespace + ".basket", me_email);
	}

}
