package com.underdog.service;

import com.underdog.domain.MemberVO;

public interface MemberService {

	public int joinCheckEmail(String s) throws Exception;

	public int joinProc(MemberVO mbVO) throws Exception;

	public MemberVO loginProc(MemberVO mbVO) throws Exception;

}
