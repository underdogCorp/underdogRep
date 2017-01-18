package com.underdog.service;

import java.util.List;

import com.underdog.domain.BoardVO;

public interface BoardService {
	 public void regist(BoardVO board) throws Exception;
	 
	 public List<BoardVO> list() throws Exception; 
	 
	 
	 
}
