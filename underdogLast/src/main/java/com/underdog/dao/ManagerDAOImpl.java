package com.underdog.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.underdog.controller.BoardController;
import com.underdog.domain.BoardVO;
import com.underdog.domain.Criteria;
import com.underdog.domain.MemberVO;
import com.underdog.domain.SearchCriteria;

@Repository
public class ManagerDAOImpl implements ManagerDAO {

	@Inject
	private SqlSession session;

	private static String namespace = "com.underdog.mapper.ManagerMapper";
	private static final Logger logger = LoggerFactory.getLogger(ManagerDAOImpl.class);

	// 회원 총 수
	@Override
	public int listCountCriteria(Criteria cri) throws Exception {
		return 0;
		//return (int) session.selectOne(namespace + ".listSearchCount", cri);
	}

	// 회원 목록(내용) 페이징 처리
	@Override
	public List<MemberVO> listSearchCriteria(SearchCriteria cri) throws Exception {

		return session.selectList(namespace + ".listSearchCriteria", cri);
	}

	// 회원 정보 삭제 하기
	@Override
	public void delProc(String me_email) throws Exception {
		logger.info("managerDAO 입장");
		logger.info("받은 me_email값:"+ me_email);
		
		session.update(namespace + ".delproc", me_email);
	}

}
