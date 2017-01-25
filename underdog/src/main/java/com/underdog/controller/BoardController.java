package com.underdog.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.underdog.domain.BoardVO;
import com.underdog.domain.Criteria;
import com.underdog.domain.PageMaker;
import com.underdog.domain.SearchCriteria;
import com.underdog.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);

	
	@Inject
	private BoardService service;

	 // 게시판 리스트 조회 + 페이징 처리	 
	 @RequestMapping( value = "/list")
	 public String list(SearchCriteria cri, Model model) throws Exception{
		 logger.info("BoardController - list() 입장");
		 logger.info("page:" + cri.getPage());
		 logger.info("perPageNum:" + cri.getPerPageNum());
	     logger.info("bo_bbsid:" + cri.getBo_bbsid());

		 String jsp = null;
				 
		 model.addAttribute("list", service.listCriteria(cri));
		 
		 PageMaker pageMaker = new PageMaker();
		 pageMaker.setCri(cri);
		 
		 pageMaker.setTotalCount(service.listCountCriteria(cri));
		 
		 model.addAttribute("pageMaker", pageMaker);
		 
		 
			if (cri.getBo_bbsid().equals("01")) {
				jsp = "/board/info/bo_info_list";
				logger.info("공지사항으로 이동");
			} else if (cri.getBo_bbsid().equals("02")) {
				jsp = "/board/free/bo_free_list";
				logger.info("자유게시판으로 이동");
			} else if (cri.getBo_bbsid().equals("03")) {
				jsp = "/board/faq/bo_faq_list";
				logger.info("faq 게시판으로 이동");
			} else if (cri.getBo_bbsid().equals("04")) {
				jsp = "/board/q&a/bo_q&a_list";
				logger.info("Q&A 게시판으로 이동");
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
			jsp = "redirect:/board/slist?bo_bbsid=04";
			logger.info("Q&A 게시판으로 이동");
		}

		return jsp;

	}

	// 게시글 상세보기 및 수정 폼
//	@RequestMapping("/board_cont")
//	public String board_cont(@RequestParam HashMap data, Model model) throws Exception {
//
//		String jsp = null;
//		String contM = null;
//		logger.info("BoardController - board_cont() 입장");
//		logger.info("page:" + data.get("page"));
//		logger.info("perPageNum:" + data.get("perPageNum"));
//		logger.info("bo_bbsid:" + data.get("bo_bbsid"));
//		logger.info("bo_idx:" + data.get("bo_idx"));
//		logger.info("keyword:" + data.get("keyword"));
//		logger.info("searchType:" + data.get("searchType"));
//		logger.info("state:" + data.get("state"));
//		
//		model.addAttribute("board", service.board_cont(data));
//		model.addAttribute("data", data);
//		
//		if (data.get("bo_bbsid").equals("01")) {
//			jsp = "/board/info/bo_info_";
//			logger.info("공지사항 상세보기 이동");
//		} else if (data.get("bo_bbsid").equals("02")) {
//			jsp = "/board/free/bo_free_";
//			logger.info("자유게시판 상세보기 이동");
//		} else if (data.get("bo_bbsid").equals("03")) {
//			jsp = "/board/faq/bo_faq_";
//			logger.info("faq 상세보기 이동");
//		} else if (data.get("bo_bbsid").equals("04")) {
//			jsp = "/board/q&a/bo_q&a_";
//			logger.info("Q&A 상세보기 이동");
//		}
//
//		if (data.get("state").equals("read") || data.get("state").equals("modifyRead")) {
//			logger.info("상세보기 및 수정페이지로 이동");
//			contM = "read";
//		} else if (data.get("state").equals("modify")) {
//			contM = "modify_form";
//			logger.info("수정하기로 이동");
//		}
//
//		return jsp + contM;
//
//	}

	
	// 게시글 상세보기 및 수정 폼
	@RequestMapping("/board_cont")
	public String board_cont(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception {

		String jsp = null;
		String contM = null;
		logger.info("BoardController - board_cont() 입장");
		logger.info("page:" + cri.getPage());
		logger.info("perPageNum:" + cri.getPerPageNum());
		logger.info("bo_bbsid:" + cri.getBo_bbsid());
		logger.info("bo_idx:" + cri.getBo_idx());
		logger.info("keyword:" + cri.getKeyword());
		logger.info("searchType:" + cri.getSearchType());
		logger.info("state:" + cri.getState());
		
		model.addAttribute("board", service.board_cont(cri));
		
		if (cri.getBo_bbsid().equals("01")) {
			jsp = "/board/info/bo_info_";
			logger.info("공지사항 상세보기 이동");
		} else if (cri.getBo_bbsid().equals("02")) {
			jsp = "/board/free/bo_free_";
			logger.info("자유게시판 상세보기 이동");
		} else if (cri.getBo_bbsid().equals("03")) {
			jsp = "/board/faq/bo_faq_";
			logger.info("faq 상세보기 이동");
		} else if (cri.getBo_bbsid().equals("04")) {
			jsp = "/board/q&a/bo_q&a_";
			logger.info("Q&A 상세보기 이동");
		}

		if (cri.getState().equals("read") || cri.getState().equals("modifyRead")) {
			logger.info("상세보기 및 수정페이지로 이동");
			contM = "read";
		} else if (cri.getState().equals("modify")) {
			contM = "modify_form";
			logger.info("수정하기로 이동");
		}

		return jsp + contM;

	}

	// 수정 프로세스
	@RequestMapping("/modifyProc")
	public String modifyProc(@RequestParam HashMap data) throws Exception{
		
		logger.info("BoardController - modifyProc() 입장");
		String bo_idx = (String) data.get("bo_idx");
		String bo_bbsid = (String) data.get("bo_bbsid");
		String page = (String) data.get("page");
		String perPageNum = (String) data.get("perPageNum");
		String keyword = (String) data.get("keyword");
		String searchType = (String) data.get("searchType");
		
		logger.info(bo_idx);
		logger.info(bo_bbsid);
		logger.info(page);
		logger.info(perPageNum);
		logger.info("keyword:" + keyword);
		logger.info("searchType:" + searchType);
		
		
		service.modifyProc(data);
		
		return "redirect:/board/board_cont?page="+page+"&perPageNum="+perPageNum+"&bo_bbsid="+bo_bbsid+"&bo_idx="+bo_idx+"&keyword="+keyword+"&searchType="+searchType+"&state=modifyRead";
	
	}
	
	// 삭제 프로세스
	@RequestMapping("/delProc")
	public String delProc(@ModelAttribute("cri") SearchCriteria cri) throws Exception {
		logger.info("BoardController - delProc 입장");
		
		String jsp = null;
		
		int bo_idx = cri.getBo_idx();
		String bo_bbsid = (String) cri.getBo_bbsid();
		int page = cri.getPage();
		int perPageNum = cri.getPerPageNum();
		String keyword = (String) cri.getKeyword();
		String searchType = (String) cri.getSearchType();
		
		
		logger.info("bo_idx:" + bo_idx);
		logger.info("bo_bbsid:" + bo_bbsid);
		logger.info("page:" + page);
		logger.info("perPageNum:" + perPageNum);
		logger.info("keyword:" + keyword);
		logger.info("searchType:" + searchType);
		
		
		service.delProc(bo_idx);
		
		if (bo_bbsid.equals("01")) {
			jsp = "redirect:/board/list?bo_bbsid=01";
			logger.info("공지사항으로 이동");
		} else if (bo_bbsid.equals("02")) {
			jsp = "redirect:/board/list?bo_bbsid=02";
			logger.info("자유게시판으로 이동");
		} else if (bo_bbsid.equals("03")) {
			jsp = "redirect:/board/list?bo_bbsid=03";
			logger.info("faq 게시판으로 이동 이동");
		} else if (bo_bbsid.equals("04")) {
			jsp = "redirect:/board/slist?page="+page+"&perPageNum="+perPageNum+"&bo_bbsid="+bo_bbsid+"&bo_idx="+bo_idx+"&keyword="+keyword+"&searchType="+searchType;
			logger.info("Q&A 게시판으로 이동");
		}

		return jsp;
	}


	 // 게시판 리스트 조회 + 페이징 처리 + 검색
	 @RequestMapping( value = "/slist")
	 public String slist(@ModelAttribute("cri") SearchCriteria cri, Model model) throws Exception{
		 logger.info("BoardController - slist() 입장");
		 logger.info("page:" + cri.getPage());
		 logger.info("perPageNum:" + cri.getPerPageNum());
		 logger.info("bo_bbsid:" + cri.getBo_bbsid());
	     logger.info("keyword:" + cri.getKeyword());
	     logger.info("searchType:" + cri.getSearchType());
	     
		 String jsp = null;
		 PageMaker pageMaker = new PageMaker();
		 pageMaker.setCri(cri);
		 

		 int totalCount = service.listSearchCount(cri);
		 pageMaker.setTotalCount(totalCount);
		 
		 List<BoardVO> list = service.listSearchCriteria(cri);
		 model.addAttribute("list", list);
		 
		 logger.info("갯수" + totalCount);
		 logger.info("목록" + list);
		 
		 
		 model.addAttribute("pageMaker", pageMaker);
		 
		 
			if (cri.getBo_bbsid().equals("01")) {
				jsp = "/board/info/bo_info_list";
				logger.info("공지사항으로 이동");
			} else if (cri.getBo_bbsid().equals("02")) {
				jsp = "/board/free/bo_free_list";
				logger.info("자유게시판으로 이동");
			} else if (cri.getBo_bbsid().equals("03")) {
				jsp = "/board/faq/bo_faq_list";
				logger.info("faq 게시판으로 이동");
			} else if (cri.getBo_bbsid().equals("04")) {
				jsp = "/board/q&a/bo_q&a_list";
				logger.info("Q&A 게시판으로 이동");
			}

			return jsp; 
	 }

	 
	// faq 게시판 리스트 조회 + 페이징 처리	 
		 @RequestMapping( value = "/listFaq")
		 public void listFaq(@RequestParam HashMap data, 
				 HttpServletResponse res, Model model) throws Exception{
			
			logger.info("BoardController - listFaq() 입장");
			logger.info("bo_bbsid:" + data.get("bo_bbsid"));
			logger.info("bo_idx:" + data.get("bo_idx"));
			
			BoardVO bv = service.listFaq(data);
			
//			model.addAttribute("listFaq", service.listFaq(data));
			
			PrintWriter writer = res.getWriter();
			writer.write(bv.getBo_content());

		 }
	 
}