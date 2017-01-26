package com.underdog.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.underdog.domain.ReplyVO;

public interface ReplyService {

	public void registerProc(HttpServletRequest req, ReplyVO replyVO);

	public List<ReplyVO> replyList(int re_bo_idx);

	public int replyCount(int re_bo_idx);

}
