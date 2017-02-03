package com.underdog.service;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.underdog.dao.MyPageDAO;
import com.underdog.domain.BoardVO;
import com.underdog.domain.MemberVO;
import com.underdog.domain.SearchCriteria;
import com.underdog.util.AES256;

@Service
public class MyPageServiceImpl implements MyPageService {

	@Inject
	private MyPageDAO dao;

	// 마이페이지 회원정보 보기
	public MemberVO memberInfo(String me_email) throws Exception {
		return dao.memberInfo(me_email);

	}

	// 마이페이지 회원정보 보기전 PW체크
	public int pwcheck(String me_email, String me_pass) throws Exception {
		// 256bit 암호화
		String key = "underdog-underdog";
		AES256 aes256 = new AES256(key);

		String me_pw = aes256.aesEncode(me_pass);

		System.out.println("서비스단에서 암호화한 me_pw값:" + me_pw);
		return dao.pwcheck(me_email, me_pw);

	}

	// 마이페이지 회원정보 수정하기
	public void modifyProc(HashMap data) throws Exception {
		dao.modifyProc(data);
	}

	// 마이페이지 내가 쓴 글 가져오기
	public List<BoardVO> myboardInfo(SearchCriteria cri) throws Exception {

		return dao.myboardInfo(cri);
	}
	// 마이 페이지 내가 쓴 글 게시글 총 수 가져오기
	@Override
	public int boardCount(String me_email) throws Exception {	
		System.out.println("서비스"+me_email);
		return dao.boardCount(me_email);
	}

}
