package com.underdog.controller;

import java.util.HashMap;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.underdog.domain.BoardVO;
import com.underdog.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	@Inject
	private BoardService service;

	// 게시판 리스트 조회
	@RequestMapping("/list")
	public String list(@RequestParam("bo_bbsid") String bo_bbsid, Model model) throws Exception{
		String jsp = null;

		logger.info("BoardController - list() 입장");

			model.addAttribute("list", service.list(bo_bbsid));

		if (bo_bbsid.equals("01")) {
			jsp = "/board/info/bo_info_list";
			logger.info("공지사항으로 이동");
		} else if (bo_bbsid.equals("02")) {
			jsp = "/board/free/bo_free_list";
			logger.info("자유게시판으로 이동");
		} else if (bo_bbsid.equals("03")) {
			jsp = "/board/faq/bo_faq_list";
			logger.info("faq로 이동 이동");
		} else if (bo_bbsid.equals("04")) {
			jsp = "/board/q&a/bo_q&a_list";
			logger.info("Q&A로 이동");
		}

		return jsp;
	}

	// 게시판 글쓰기 폼 보기
	@RequestMapping("/registerForm")
	public String registerForm(@RequestParam("bo_bbsid") String bo_bbsid) throws Exception{

		String jsp = null;

		logger.info("BoardController - registerForm() 입장");

		if (bo_bbsid.equals("01")) {
			jsp = "/board/info/bo_info_write_form";
			logger.info("공지사항 글쓰기 입장");
		} else if (bo_bbsid.equals("02")) {
			jsp = "/board/free/bo_free_write_form";
			logger.info("자유게시판 글쓰기 입장");
		} else if (bo_bbsid.equals("03")) {
			jsp = "/board/faq/bo_faq_write_form";
			logger.info("faq 글쓰기 입장");
		} else if (bo_bbsid.equals("04")) {
			jsp = "/board/q&a/bo_q&a_write_form";
			logger.info("Q&A 글쓰기 입장");
		}

		return jsp;

	}

	// 게시판 글쓰기 프로세스
	@RequestMapping("/registerProc")
	public String registerProc(HttpServletRequest req, @ModelAttribute BoardVO boardVO) throws Exception {

		String jsp = null;
		logger.info("BoardController - registerProc() 입장");
		logger.info(boardVO.getBo_bbsid());

		service.registerProc(req, boardVO);

		if (boardVO.getBo_bbsid().equals("01")) {
			jsp = "redirect:/board/list?bo_bbsid=01";
			logger.info("공지사항으로 이동");
		} else if (boardVO.getBo_bbsid().equals("02")) {
			jsp = "redirect:/board/list?bo_bbsid=02";
			logger.info("자유게시판으로 이동");
		} else if (boardVO.getBo_bbsid().equals("03")) {
			jsp = "redirect:/board/list?bo_bbsid=03";
			logger.info("faq 게시판으로 이동 이동");
		} else if (boardVO.getBo_bbsid().equals("04")) {
			jsp = "redirect:/board/list?bo_bbsid=04";
			logger.info("Q&A 게시판으로 이동");
		}

		return jsp;

	}

	// 게시글 상세보기 및 수정 폼
	@RequestMapping("/board_cont")
	public String board_cont(@RequestParam HashMap data, Model model) throws Exception {

		String jsp = null;
		String contM = null;
		logger.info("BoardController - board_cont() 입장");
		logger.info("bo_idx:" + data.get("bo_idx"));

		model.addAttribute("data", service.board_cont(data));

		if (data.get("bo_bbsid").equals("01")) {
			jsp = "/board/info/bo_info_";
			logger.info("공지사항 상세보기 이동");
		} else if (data.get("bo_bbsid").equals("02")) {
			jsp = "/board/free/bo_free_";
			logger.info("자유게시판 상세보기 이동");
		} else if (data.get("bo_bbsid").equals("03")) {
			jsp = "/board/faq/bo_feq_";
			logger.info("faq 상세보기 이동");
		} else if (data.get("bo_bbsid").equals("04")) {
			jsp = "/board/q&a/bo_q&a_";
			logger.info("Q&A 상세보기 이동");
		}

		if (data.get("state").equals("read")) {
			contM = "read";
		} else if (data.get("state").equals("modify")) {
			contM = "modify_form";
		}

		return jsp + contM;

	}


	// 수정 프로세스
	@RequestMapping("/modifyProc")
	public String modifyProc(@RequestParam HashMap data) throws Exception{
		
		logger.info("BoardController - modifyProc() 입장");
		String bo_idx = (String) data.get("bo_idx");
		String bo_bbsid = (String) data.get("bo_bbsid");
		
		logger.info(bo_idx);
		logger.info(bo_bbsid);
		
		service.modifyProc(data);

		return "/board/board_cont?bo_bbsid="+bo_bbsid+"&bo_idx="+bo_idx+"&state=read";
	
	}
	
	// 삭제 프로세스
	@RequestMapping("/delProc")
	public String delProc(@RequestParam("bo_idx") int bo_idx, @RequestParam("bo_bbsid") int bo_bbsid) throws Exception {
		String jsp = null;
		logger.info("bo_idx:" + bo_idx);
		logger.info("BoardController - delProc 입장");
		service.delProc(bo_idx);

		if (bo_bbsid == 01) {
			jsp = "/board/list?bo_bbsid=01";
			logger.info("공지사항으로 이동");
		} else if (bo_bbsid == 02) {
			jsp = "/board/list?bo_bbsid=02";
			logger.info("자유게시판으로 이동");
		} else if (bo_bbsid == 03) {
			jsp = "/board/list?bo_bbsid=03";
			logger.info("faq로 이동 이동");
		} else if (bo_bbsid == 04) {
			jsp = "/board/list?bo_bbsid=04";
			logger.info("Q&A로 이동");
		}

		return jsp;
	}

}