package com.underdog.service;

import java.util.List;

import com.underdog.domain.BoardVO;


public interface BoardService {
	 public void registerProc(BoardVO board) throws Exception;
	 
	 public List<BoardVO> list(String bbsid) throws Exception;

	
	 
	 
	 
}
