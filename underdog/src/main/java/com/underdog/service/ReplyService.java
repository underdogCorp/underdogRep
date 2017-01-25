package com.underdog.service;

import javax.servlet.http.HttpServletRequest;

import com.underdog.domain.ReplyVO;

public interface ReplyService {

	public void registerProc(HttpServletRequest req, ReplyVO reply);

}
