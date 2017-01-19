package com.underdog.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
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

	@Inject
	private BoardService service;

	// @RequestMapping(value = "/bo_free_list")
	// public String BoardWriteMove() throws Exception {
	//
	// logger.info("자유게시판 리스트 진입");
	//
	// return "/board/free/bo_free_list";
	// }
	//
	// @RequestMapping(value = "/registerForm")
	// public String registerForm() throws Exception {
	//
	// logger.info("글쓰기 폼 이동");
	//
	// return "/board/free/bo_free_write_form";
	// }
	//

	@RequestMapping("/list")
	public String list(@RequestParam("bbsid") String bbsid, Model model) {
		String jsp = null;

		logger.info("BoardController - list() 입장");

		// try {
		// model.addAttribute("list", service.list(bbsid));
		// } catch (Exception e) {
		// e.printStackTrace();
		// }

		if (bbsid.equals("01")) {
			jsp = "/board/info/bo_info_list";
			logger.info("공지사항으로 이동");
		} else if (bbsid.equals("02")) {

			jsp = "/board/free/bo_free_list";
			logger.info("자유게시판으로 이동");
		} else if (bbsid.equals("03")) {
			jsp = "/board/faq/bo_faq_list";
			logger.info("faq로 이동 이동");
		} else if (bbsid.equals("04")) {
			jsp = "/board/q&a/bo_q&a_list";
			logger.info("Q&A로 이동");
		}

		return jsp;
	}

	@RequestMapping("/registerForm")
	public String registerForm(@RequestParam("bbsid") String bbsid) {

		String jsp = null;

		logger.info("BoardController - registerForm() 입장");

		if (bbsid.equals("01")) {
			jsp = "/board/info/bo_info_write_form";
			logger.info("공지사항 글쓰기 입장");
		} else if (bbsid.equals("02")) {
			jsp = "/board/free/bo_free_write_form";
			logger.info("자유게시판 글쓰기 입장");
		} else if (bbsid.equals("03")) {
			jsp = "/board/faq/bo_faq_write_form";
			logger.info("faq 글쓰기 입장");
		} else if (bbsid.equals("04")) {
			jsp = "/board/q&a/bo_q&a_write_form";
			logger.info("Q&A 글쓰기 입장");
		}

		return jsp;

	}

	// @RequestMapping(value = "/registerProc", method = RequestMethod.POST)
	// public String registPOST(BoardVO board, RedirectAttributes rttr) throws
	// Exception {
	//
	// logger.info("regist post ...........");
	// logger.info(board.toString());
	//
	// service.regist(board);
	//
	// rttr.addFlashAttribute("msg", "success");
	// return "redirect:/bo_free_list";
	// }

	@RequestMapping("/registerProc")
<<<<<<< HEAD
	public String registerProc(@ModelAttribute("BoardVO") BoardVO boardVO)
			throws Exception {
=======
	public String registerProc(@ModelAttribute("BoardVO") BoardVO board) throws Exception {
>>>>>>> branch 'master' of https://github.com/underdogCorp/underdogRep.git

		String jsp = null;
		logger.info("BoardController - registerProc() 입장");
<<<<<<< HEAD
		
		System.out.println("컨트롤러 입장");
		
		logger.info(board.toString());
		
		service.regist(board);
		
		
	
		if (boardVO.getBo_bbsid() == 01) {
=======
		System.out.println("컨트롤러 입장");

		logger.info(board.toString());

		service.regist(board);

		if (board.getBo_bbsid() == 01) {
>>>>>>> branch 'master' of https://github.com/underdogCorp/underdogRep.git
			jsp = "/board/info/bo_info_write_form";
<<<<<<< HEAD
		} else if (bbsid.equals("02")) {
=======

		} else if (board.getBo_bbsid() == 02) {

>>>>>>> branch 'master' of https://github.com/underdogCorp/underdogRep.git
			return "redirect:/board/list?bbsid=02";
			// jsp = "/board/free/bo_free_write_form";
		} else if (board.getBo_bbsid() == 03) {
			jsp = "/board/faq/bo_faq_write_form";
		} else if (board.getBo_bbsid() == 04) {
			jsp = "/board/q&a/bo_q&a_write_form";
		}

		return jsp;

	}

}