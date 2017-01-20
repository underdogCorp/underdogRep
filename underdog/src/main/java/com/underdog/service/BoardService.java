package com.underdog.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.underdog.domain.BoardVO;


public interface BoardService {
	
	public List<BoardVO> list(String bbsid) throws Exception;
	
	public void registerProc(HttpServletRequest req, BoardVO boardVO) throws Exception;

	public BoardVO board_cont(HashMap data) throws Exception;

	public void modifyProc(BoardVO baordVO) throws Exception;

	
	 
	 
	 
}
