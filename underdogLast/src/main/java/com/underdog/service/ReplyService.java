package com.underdog.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.underdog.domain.ReplyVO;

public interface ReplyService {

	//댓글 등록 프로세스
	public void registerProc(ReplyVO replyVo, HttpServletRequest req);
	
	//댓글 리스트 불러오기
	public List<ReplyVO> reply_cont(ReplyVO replyVo);

	


}
