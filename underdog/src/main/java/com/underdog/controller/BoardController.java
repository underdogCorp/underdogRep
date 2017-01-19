package com.underdog.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

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
	
	//게시판 리스트 조회
	@RequestMapping("/list")
	public String list(@RequestParam("bbsid") int bbsid, Model model) {
		String jsp = null;

		logger.info("BoardController - list() 입장");

		 try {
		 model.addAttribute("list", service.list(bbsid));
		 } catch (Exception e) {
		 e.printStackTrace();
		 }

			if (bbsid == 01) {
				jsp = "/board/info/bo_info_list";
				logger.info("공지사항으로 이동");
			} else if (bbsid == 02) {
				jsp = "/board/free/bo_free_list";
				logger.info("자유게시판으로 이동");
			} else if (bbsid == 03) {
				jsp = "/board/faq/bo_faq_list";
				logger.info("faq로 이동 이동");
			} else if (bbsid == 04) {
				jsp = "/board/q&a/bo_q&a_list";
				logger.info("Q&A로 이동");
			}

		return jsp;
	}

	//게시판 글쓰기 폼 보기
	@RequestMapping("/registerForm")
	public String registerForm(@RequestParam("bbsid") int bbsid) {

		String jsp = null;

		logger.info("BoardController - registerForm() 입장");

		if (bbsid == 01) {
			jsp = "/board/info/bo_info_write_form";
			logger.info("공지사항 글쓰기 입장");
		} else if (bbsid == 02) {
			jsp = "/board/free/bo_free_write_form";
			logger.info("자유게시판 글쓰기 입장");
		} else if (bbsid == 03) {
			jsp = "/board/faq/bo_faq_write_form";
			logger.info("faq 글쓰기 입장");
		} else if (bbsid == 04) {
			jsp = "/board/q&a/bo_q&a_write_form";
			logger.info("Q&A 글쓰기 입장");
		}

		return jsp;

	}


	//게시판 글쓰기 프로세스
	@RequestMapping("/registerProc")
	public String registerProc(HttpServletRequest req, @ModelAttribute BoardVO boardVO) throws Exception {
	
		
		String jsp = null;
		logger.info("BoardController - registerProc() 입장");

		service.registerProc(req, boardVO);
		
		if (boardVO.getBo_bbsid() ==01) {
			jsp = "redirect:/board/list?bbsid=01";
			logger.info("공지사항으로 이동");
		} else if (boardVO.getBo_bbsid() == 02) {
			jsp = "redirect:/board/list?bbsid=02";
			logger.info("자유게시판으로 이동");
		} else if (boardVO.getBo_bbsid() == 03) {
			jsp = "redirect:/board/list?bbsid=03";
			logger.info("faq로 이동 이동");
		} else if (boardVO.getBo_bbsid() == 04) {
			jsp = "redirect:/board/list?bbsid=04";
			logger.info("Q&A로 이동");
		}
		
		return jsp;

	}

	
	@RequestMapping("/read")
	public String read() throws Exception {
	
		
		String jsp = null;
		logger.info("BoardController - read() 입장");

		service.registerProc(req, boardVO);
	
		
		return jsp;

	}
	
	
}