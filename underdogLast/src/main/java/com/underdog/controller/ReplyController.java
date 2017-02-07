package com.underdog.controller;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.underdog.domain.ReplyVO;
import com.underdog.service.ReplyService;

@Controller
@RequestMapping("/reply/*")
public class ReplyController {
	
	private static final Logger logger = LoggerFactory.getLogger(ReplyController.class);
	
	@Inject
	private ReplyService service;
	
	// 댓글 등록 프로세스
	@ResponseBody
	@RequestMapping("/registerProc")
//	public void registerProc(@RequestParam HashMap date, HttpServletRequest req, HttpServletResponse res) throws Exception{
	public void registerProc(ReplyVO replyVo, HttpServletRequest req) throws Exception{
//		PrintWriter out = res.getWriter();
		logger.info("re_bo_idx : "+replyVo.getRe_bo_idx());
		logger.info("re_me_email : "+replyVo.getRe_me_email());
		logger.info("re_content : "+replyVo.getRe_content());

		service.registerProc(replyVo, req);

		//out.println("1");
	}
	
	
	// 댓글 리스트 불러오기
	@RequestMapping("/reply_cont")
	public String  reply_cont(ReplyVO replyVo, Model model) {
		logger.info("ReplyController - reply_cont() 입장");
		
	
		List<ReplyVO> list = service.reply_cont(replyVo);
		model.addAttribute("reply", list);
		
		System.out.println(list);
		return "/board/comment/comment_list";
	}
	
	

	
	
	
}
