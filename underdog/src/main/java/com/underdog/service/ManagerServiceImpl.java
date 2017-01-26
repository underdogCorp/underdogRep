package com.underdog.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.underdog.dao.ManagerDAO;
import com.underdog.domain.Criteria;
import com.underdog.domain.MemberVO;
import com.underdog.domain.SearchCriteria;

@Service
public class ManagerServiceImpl implements ManagerService {
	@Autowired
	private ManagerDAO managerdao;

	
//회원 총 수 가져오기
	@Override
	public int listCountCriteria(Criteria cri) throws Exception {
		
		return managerdao.listCountCriteria(cri);
	}


//회원 목록(내용) 페이징 처리
	@Override
	public List<MemberVO> listSearchCriteria(SearchCriteria cri) throws Exception {
			
		return managerdao.listSearchCriteria(cri);
	}


	@Override
	public void delProc(String me_email) throws Exception {
	
			managerdao.delProc(me_email);
	}
	
	

}
