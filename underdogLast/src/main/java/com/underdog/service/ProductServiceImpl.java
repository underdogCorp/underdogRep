package com.underdog.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.underdog.dao.ProductDAO;
import com.underdog.domain.ProductVO;

@Service
public class ProductServiceImpl implements ProductService {

	
	private static final Logger logger = LoggerFactory.getLogger(ProductServiceImpl.class);
	
	
	@Inject
	private ProductDAO dao;
	
	// 상품 리스트 보기
	@Override
	public List<ProductVO> list() {
		
		logger.info("ProductServiceImpl - list() 입장");
		
		return dao.list();
	}
	
	
	// 상품 등록 프로세스
	@Override
	public void registerProc(ProductVO productVo, HttpServletRequest req) {
		
		logger.info("ProductServiceImpl - registerProc() 입장");
		
		productVo.setPr_regip(req.getRemoteAddr());
		
		logger.info(productVo.getPr_regip());
		System.out.println(productVo.getPr_regip());
		
		//data.put("pr_regip", req.getRemoteAddr());
		dao.registerProc(productVo);
	}



}
