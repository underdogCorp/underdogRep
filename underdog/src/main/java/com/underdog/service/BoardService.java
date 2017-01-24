package com.underdog.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.underdog.domain.BoardVO;
import com.underdog.domain.Criteria;
import com.underdog.domain.SearchCriteria;


public interface BoardService {
	
	public List<BoardVO> list(String bbsid) throws Exception;
	
	public void registerProc(HttpServletRequest req, BoardVO boardVO) throws Exception;

	public BoardVO board_cont(HashMap data) throws Exception;

	public void delProc (String bo_idx) throws Exception;

	public void modifyProc(Map data) throws Exception;
	
	public List<BoardVO> listCriteria(Criteria cri) throws Exception;

	public int listCountCriteria(Criteria cri) throws Exception;

<<<<<<< HEAD
	public BoardVO listFaq(Map data) throws Exception;
=======
	public List<BoardVO> listSearchCriteria(SearchCriteria cri) throws Exception;

	public int listSearchCount(SearchCriteria cri) throws Exception;
>>>>>>> branch 'master' of https://github.com/underdogCorp/underdogRep.git
	
	

	


  
	 
}
