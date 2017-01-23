package com.underdog.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.underdog.service.MyPageService;

@Controller
@RequestMapping("/mypage/*")
public class MyPageController {

	@Inject
	private MyPageService service;
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	
	//마이페이지 회원정보 보기
	@RequestMapping(value = "/mypage")
	public String mypage(@RequestParam("me_email") String me_email, Model model) throws Exception {

		String jsp = null;
		System.out.println("쎄션 me_email:"+me_email);
		
		model.addAttribute("memberInfo", service.memberInfo(me_email));	
		logger.info(service.memberInfo(me_email).getMe_regdate().toString());
		
		jsp = "/mypage/mypage";
		logger.info("mypage - 마이페이지폼 이동");

		return jsp;

	}
}
