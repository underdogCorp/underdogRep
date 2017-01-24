package com.underdog.dao;

import com.underdog.domain.MemberVO;

public interface MyPageDAO {

	//마이페이지 회원정보 보기
	public MemberVO memberInfo(String me_email) throws Exception;
	//마이페이지 회원정보 보기전 pw체크
	public int pwcheck(String me_email,String me_pw) throws Exception;
	
	
	
	
}
