package com.underdog.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.underdog.domain.BoardVO;
import com.underdog.domain.Criteria;
import com.underdog.domain.SearchCriteria;

public interface BoardDAO {

	public List<BoardVO> list(String bbsid) throws Exception;

	public void registerProc(BoardVO boardVO);

	public void delproc(int bo_idx) throws Exception;

	public BoardVO board_cont(SearchCriteria cri) throws Exception;

	public void modifyProc(Map data) throws Exception;
	
	public List<BoardVO> listCriteria(Criteria cri) throws Exception;

	public int listCountCriteria(Criteria cri) throws Exception; 
	
	public BoardVO listFaq(Map data) throws Exception;
	
	
	public List<BoardVO> listSearchCriteria(SearchCriteria cri)throws Exception;
	
	public int listSearchCount(SearchCriteria cri)throws Exception;

	//
	// public List<BoardVO> listPage(int page) throws Exception;
	//
	
	//
	// public int countPaging(Criteria cri) throws Exception;
	//
	// //use for dynamic sql
	//
	// public List<BoardVO> listSearch(SearchCriteria cri)throws Exception;
	//
	// public int listSearchCount(SearchCriteria cri)throws Exception;
}
