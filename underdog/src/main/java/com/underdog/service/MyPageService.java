package com.underdog.service;

import java.util.List;

import com.underdog.domain.MemberVO;

public interface MyPageService {
	//마이페이지 회원정보 보기
	public MemberVO memberInfo(String me_email) throws Exception;
	
}
