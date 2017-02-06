package com.underdog.dao;

import java.util.List;
import java.util.Map;

import com.underdog.domain.BasketVO;

public interface BasketDAO {

	// 장바구니 조회 (List 자료형)
	public List<BasketVO> basket(String me_email) throws Exception;
	
	// 장바구니 삭제
	public void delete(Map<String, String> param) throws Exception;
	
}
