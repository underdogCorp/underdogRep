package com.underdog.dao;

import java.util.HashMap;
import java.util.List;

import com.underdog.domain.ReplyVO;

public interface ReplyDAO {

	public void registerProc(ReplyVO replyVo);

	public List<ReplyVO> replyList(ReplyVO replyVo);

}
