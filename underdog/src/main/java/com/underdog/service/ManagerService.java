package com.underdog.service;

import java.util.List;

import com.underdog.domain.BoardVO;
import com.underdog.domain.Criteria;
import com.underdog.domain.MemberVO;
import com.underdog.domain.SearchCriteria;

public interface ManagerService {
	
	public List<MemberVO> listSearchCriteria(SearchCriteria cri) throws Exception;
	
	public int listCountCriteria(Criteria cri) throws Exception;
	
	public void delProc(String me_email) throws Exception;
	

}
