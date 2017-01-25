package com.underdog.service;

import java.util.List;

import com.underdog.domain.BasketVO;

public interface BasketService {

	// 장바구니 조회 (List 자료형)
	public List<BasketVO> basket(String me_email);
	
}
