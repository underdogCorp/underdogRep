package com.underdog.dao;

import java.util.HashMap;
import java.util.List;

import com.underdog.domain.BoardVO;
import com.underdog.domain.MemberVO;

public interface MyPageDAO {

	//마이페이지 회원정보 보기
	public MemberVO memberInfo(String me_email) throws Exception;
	//마이페이지 회원정보 보기전 pw체크
	public int pwcheck(String me_email,String me_pw) throws Exception;
	//마이페이지 회원정보 수정하기
	public void modifyProc(HashMap data)throws Exception;
	//내가 쓴글 가져오기
	public List<BoardVO> myboardInfo(String me_email)throws Exception;
	
	
	
}
