package com.underdog.service;

import javax.servlet.http.HttpServletRequest;

import com.underdog.domain.ProductVO;

public interface ProductService {

	public void registerProc(ProductVO productVo, HttpServletRequest req);

}
