package com.underdog.controller;

import java.util.HashMap;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.underdog.domain.ProductVO;
import com.underdog.service.ProductService;

@Controller
@RequestMapping("/product/*")
public class ProductController {
	
	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@Inject
	private ProductService service;
	
	//상품 리스트 보기
	@RequestMapping("/list")
	public String list(Model model){
		logger.info("ProductController - list() 입장");

//		model.addAttribute("item", service.list());
		
		return "/product/item_list";
	}
	
	
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
		 
		 logger.info("pr_me_email : " + productVo.getPr_me_email());
		 logger.info("pr_me_nick : " + productVo.getPr_me_nick());
		 logger.info("pr_highcode : " + productVo.getPr_highcode());
		 logger.info("pr_lowcode : " + productVo.getPr_lowcode());
		 logger.info("pr_title : " + productVo.getPr_title());
		 logger.info("pr_content : " + productVo.getPr_content());
		 logger.info("pr_keyword : " + productVo.getPr_keyword());
		 logger.info("pr_region : " + productVo.getPr_region());
		 logger.info("pr_pay_h : " + productVo.getPr_pay_h());
		 logger.info("pr_pay_d : " + productVo.getPr_pay_d());
		 logger.info("pr_pay_m : " + productVo.getPr_pay_m());
		 

		 service.registerProc(productVo, req);
		 
		return "/";
	}
	
	// 상품소개(능력자란?) 페이지 이동
	@RequestMapping("/item_introduce")
	public String item_introduce(){
		logger.info("ProductController - registerProc() 입장");
		 
		return "product/item_introduce";
	}
	
	// 상품 상세보기 프로세스
	@RequestMapping("/read")
	public String read(){
		
		return "product/item_read";
	}
}
