package com.underdog.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.underdog.domain.ReplyVO;

public interface ReplyService {

	public List<ReplyVO> reply_cont(HashMap date);
	
	public void registerProc(HashMap date);


}
