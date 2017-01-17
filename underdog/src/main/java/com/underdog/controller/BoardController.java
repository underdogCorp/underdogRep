package com.underdog.controller;

<<<<<<< HEAD
import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.underdog.service.BoardService;

@Controller
// @RequestMapping("/board/*")
=======
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/board")
>>>>>>> branch 'master' of https://github.com/underdogCorp/underdogRep.git
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
<<<<<<< HEAD
	//
	@Inject
	private BoardService service;

	//
	@RequestMapping(value = "/bo_free_list")
	public String BoardWriteMove() throws Exception {

		logger.info("자유게시판 리스트 진입");

		return "/board/free/bo_free_list";
	}

	@RequestMapping(value = "/registerForm")
	public String registerForm() throws Exception {

		logger.info("글쓰기 폼 이동");

		return "/board/free/bo_free_write_form";
	}
}
=======
	
	@RequestMapping(value = "/registerForm", method = RequestMethod.GET)
	public void registerForm(){
		
		logger.info("게시판 글쓰기 폼 진입");
		
		
	}
	
}
>>>>>>> branch 'master' of https://github.com/underdogCorp/underdogRep.git
