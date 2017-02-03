package com.underdog.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.underdog.dao.MemberDAO;
import com.underdog.domain.MemberVO;
import com.underdog.util.AES256;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDAO mbDAO;
	
	@Override
	public int joinCheckEmail(String s) throws Exception {
		return mbDAO.joinCheckEmail(s);
	}

	@Override
	public int joinProc(MemberVO mbVO) throws Exception {
		//256bit 암호화
		String key = "underdog-underdog";
		AES256 aes256 = new AES256(key);
		
		String me_pw = aes256.aesEncode(mbVO.getMe_pw());
		mbVO.setMe_pw(me_pw);
		
		return mbDAO.joinProc(mbVO);
	}
	
	@Override
	public MemberVO loginProc(MemberVO mbVO) throws Exception {
		//256bit 암호화
		MemberVO vo = new MemberVO();
		String key = "underdog-underdog";
		AES256 aes256 = new AES256(key);
		
		String me_pw = aes256.aesEncode(mbVO.getMe_pw());
		mbVO.setMe_pw(me_pw);
		
		vo = mbDAO.loginProc(mbVO);
		
		return vo;
	}
}
