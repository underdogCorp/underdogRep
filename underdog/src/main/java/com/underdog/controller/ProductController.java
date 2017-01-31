package com.underdog.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.underdog.domain.ProductVO;
import com.underdog.service.BoardService;
import com.underdog.service.ProductService;

@Controller
@RequestMapping("/product/*")
public class ProductController {
	
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@Inject
	private ProductService service;
	
	
	// 상품 등록 폼 보기
	@RequestMapping("/registerForm")
	public String registerForm(){
		
		 logger.info("ProductController - registerForm() 입장");

		return "/product/item_write_form";
	}

	// 상품 등록 하기
	@RequestMapping("/registerProc")
	public String registerProc(ProductVO productVo, HttpServletRequest req){
		
		 logger.info("ProductController - registerProc() 입장");

		 service.registerProc(productVo, req);
		 
		return "/";
	}
	
	
}
