package com.underdog.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.underdog.dao.ManagerDAO;
import com.underdog.domain.MemberVO;

@Service
public class ManagerServiceImpl implements ManagerService {
	@Autowired
	private ManagerDAO managerdao;

	@Override
	public List<MemberVO> members() {
		return managerdao.members();
		
	}

}
