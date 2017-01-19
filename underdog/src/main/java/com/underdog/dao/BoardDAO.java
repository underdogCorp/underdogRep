package com.underdog.dao;

import java.util.List;

import com.underdog.domain.BoardVO;

public interface BoardDAO {

	
	  public List<BoardVO> list(String bbsid) throws Exception;
	
	  public void registerProc(BoardVO boardVO);

//	  public BoardVO read(Integer bno) throws Exception;
//
//	  public void update(BoardVO vo) throws Exception;
//
//	  public void delete(Integer bno) throws Exception;
//

//
//	  public List<BoardVO> listPage(int page) throws Exception;
//
//	  public List<BoardVO> listCriteria(Criteria cri) throws Exception;
//
//	  public int countPaging(Criteria cri) throws Exception;
//	  
//	  //use for dynamic sql
//	  
//	  public List<BoardVO> listSearch(SearchCriteria cri)throws Exception;
//	  
//	  public int listSearchCount(SearchCriteria cri)throws Exception;
}
