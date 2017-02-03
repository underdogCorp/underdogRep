package com.underdog.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.underdog.dao.BasketDAO;
import com.underdog.domain.BasketVO;

@Service
public class BasketServiceImpl implements BasketService {

	@Inject
	private BasketDAO dao;
	
	@Override
	public List<BasketVO> basket(String me_email) throws Exception {
		return dao.basket(me_email);
	}
	
}
