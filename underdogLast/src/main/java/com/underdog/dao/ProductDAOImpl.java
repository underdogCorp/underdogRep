package com.underdog.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.underdog.controller.ProductController;
import com.underdog.domain.ProductVO;

@Repository
public class ProductDAOImpl implements ProductDAO {

	@Inject
	private SqlSession session;
	
	private static String namespace = "com.underdog.mapper.productMapper";
	
	private static final Logger logger = LoggerFactory.getLogger(ProductDAOImpl.class);
	
	
	// 상품 리스트 보기
	@Override
	public List<ProductVO> list() {
		logger.info("ProductDAOImpl - list() 입장");
		
		return session.selectList(namespace + ".list");
	}


	// 상품 등록 프로세스
	@Override
	public void registerProc(ProductVO productVo) {
		logger.info("ProductDAOImpl - registerProc() 입장");
		
		session.insert(namespace + ".registerProc", productVo);
		
	}



}
