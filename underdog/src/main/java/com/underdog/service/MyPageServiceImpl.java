package com.underdog.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.underdog.dao.MyPageDAO;
import com.underdog.domain.MemberVO;

@Service
public class MyPageServiceImpl implements MyPageService {
	
	@Inject
	private MyPageDAO dao;
	
	//마이페이지 회원정보 보기
	public MemberVO memberInfo(String me_email) throws Exception {
		return dao.memberInfo(me_email);
	
	}
}
