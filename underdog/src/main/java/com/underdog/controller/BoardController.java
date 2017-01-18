package com.underdog.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.underdog.domain.BoardVO;
import com.underdog.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

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

	@RequestMapping(value = "/registerProc", method = RequestMethod.POST)
	public String registPOST(BoardVO board, RedirectAttributes rttr) throws Exception {

		logger.info("regist post ...........");
		logger.info(board.toString());

		service.regist(board);

		rttr.addFlashAttribute("msg", "success");
		return "redirect:/bo_free_list";
	}
	
	@RequestMapping("/list")
	public String list(@RequestParam("bbsid") String bbsid, Model model){
	
		logger.info("게시판 리스트 입장");
		
		try {
			model.addAttribute("list", service.list(bbsid));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return null;
	}
	
}
