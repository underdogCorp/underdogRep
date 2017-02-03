package com.underdog.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.underdog.domain.ProductVO;

public interface ProductService {

	public List<ProductVO> list();

	public void registerProc(ProductVO productVo, HttpServletRequest req);

}
