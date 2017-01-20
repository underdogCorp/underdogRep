package com.underdog.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.underdog.domain.BoardVO;


public interface BoardService {
	
	public List<BoardVO> list(String bbsid) throws Exception;
	
	public void registerProc(HttpServletRequest req, BoardVO boardVO) throws Exception;
	 
	public List<BoardVO> read(Map data) throws Exception;

	public Object board_cont(HashMap data);

	
	 
	 
	 
}
