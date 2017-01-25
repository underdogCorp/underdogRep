package com.underdog.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.underdog.domain.ReplyVO;
import com.underdog.domain.SearchCriteria;
import com.underdog.service.ReplyService;

@Controller("/reply")
public class ReplyController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReplyController.class);
	
	@Inject
	private ReplyService service;
	
	// 댓글 등록 프로세스
	@RequestMapping("/registerProc")
	public String registerProc(HttpServletRequest req, @ModelAttribute("cri") SearchCriteria cri, ReplyVO replyVO){
		
		logger.info("ReplyController - registerProc() 입장");
		
		int bo_idx = cri.getBo_idx();
		String bo_bbsid = (String) cri.getBo_bbsid();
		int page = cri.getPage();
		int perPageNum = cri.getPerPageNum();
		String keyword = (String) cri.getKeyword();
		String searchType = (String) cri.getSearchType();
		String re_content = (String) replyVO.getRe_content();
		String re_me_email = (String) replyVO.getRe_me_email();
		
		logger.info("bo_idx:" + bo_idx);
		logger.info("bo_bbsid:" + bo_bbsid);
		logger.info("page:" + page);
		logger.info("perPageNum:" + perPageNum);
		logger.info("keyword:" + keyword);
		logger.info("searchType:" + searchType);
		logger.info("re_content:" + re_content);
		logger.info("re_me_email:" + re_me_email);
		
		service.registerProc(req, replyVO);
		
		
		
		return null;
	}
	
}
