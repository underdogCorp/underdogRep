package com.underdog.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.underdog.domain.PageMaker;
import com.underdog.domain.ReplyVO;
import com.underdog.domain.SearchCriteria;
import com.underdog.service.ReplyService;

@Controller
@RequestMapping("/reply/*")
public class ReplyController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReplyController.class);
	
	@Inject
	private ReplyService service;
	
	// 댓글 등록 프로세스
	@RequestMapping("/registerProc")
	public String registerProc(HttpServletRequest req, 
			@ModelAttribute("cri") SearchCriteria cri, 
			ReplyVO replyVO,
			Model model
			){
		
		logger.info("ReplyController - registerProc() 입장");
	
		
		logger.info("bo_idx:" + cri.getBo_idx());
		logger.info("bo_bbsid:" + (String) cri.getBo_bbsid());
		logger.info("page:" + cri.getPage());
		logger.info("perPageNum:" + cri.getPerPageNum());
		logger.info("keyword:" + (String) cri.getKeyword());
		logger.info("searchType:" + (String) cri.getSearchType());
		logger.info("re_content:" + (String) replyVO.getRe_content());
		logger.info("re_me_email:" + (String) replyVO.getRe_me_email());
		logger.info("state:" + cri.getState());
		
		
		service.registerProc(req, replyVO);
		
		model.addAttribute("rList", service.replyList(replyVO.getRe_bo_idx()));
		int ssss = service.replyCount(replyVO.getRe_bo_idx());
		model.addAttribute("rCount", service.replyCount(replyVO.getRe_bo_idx()));
		logger.info(""+ssss);
		
		PageMaker pm = new PageMaker();
		pm.setCri(cri);
		
		return "redirect:/board/board_cont"+pm.makeSearch(cri.getPage())+"&bo_bbsid="+cri.getBo_bbsid()+"&bo_idx="+cri.getBo_idx()+"&state=modifyRead";

	}
	
	
	
	
	
}
