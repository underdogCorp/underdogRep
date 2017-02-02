package com.underdog.dao;

import java.util.HashMap;
import java.util.List;

import com.underdog.domain.ProductVO;

public interface ProductDAO {

	public void registerProc(ProductVO productVo);

	public List<ProductVO> list();

}
