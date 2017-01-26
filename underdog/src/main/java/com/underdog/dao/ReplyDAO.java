package com.underdog.dao;

import java.util.List;

import com.underdog.domain.ReplyVO;

public interface ReplyDAO {

	public void registerProc(ReplyVO replyVO);

	public List<ReplyVO> replyList(int re_bo_idx);

	public int replyCount(int re_bo_idx);

}
