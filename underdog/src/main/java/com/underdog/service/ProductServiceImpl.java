package com.underdog.service;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.underdog.controller.ProductController;
import com.underdog.dao.ProductDAO;
import com.underdog.domain.ProductVO;

@Service
public class ProductServiceImpl implements ProductService {

	
	private static final Logger logger = LoggerFactory.getLogger(ProductServiceImpl.class);
	
	
	@Inject
	private ProductDAO dao;
	
	// 상품 등록 프로세스
	@Override
	public void registerProc(ProductVO productVo, HttpServletRequest req) {
		
		logger.info("ProductServiceImpl - registerProc() 입장");
		
		productVo.setPr_regip(req.getRemoteAddr());
		
		dao.registerProc(productVo);
	}

}
