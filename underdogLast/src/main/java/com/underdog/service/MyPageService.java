package com.underdog.service;

import java.util.HashMap;
import java.util.List;

import com.underdog.domain.BoardVO;
import com.underdog.domain.MemberVO;
import com.underdog.domain.SearchCriteria;

public interface MyPageService {
	//마이페이지 회원정보 보기
	public MemberVO memberInfo(String me_email) throws Exception;
	//마이페이지 회원정보 보기전 PW 체크
	public int pwcheck(String me_email,String me_pw)throws Exception;
	//마이페이지 회원정보 수정 하기
	public void modifyProc(HashMap data)throws Exception;
	//내가 쓴글 가져 오기
	public List<BoardVO> myboardInfo(SearchCriteria cri) throws Exception;
	//페이징처리
	public int boardCount(String me_email)throws Exception;
	
	
}
