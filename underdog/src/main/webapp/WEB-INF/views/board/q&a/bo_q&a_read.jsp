<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<%@ include file="/WEB-INF/views/include/nav.jsp"%>


게시판 번호 : ${list.bo_idx }" <br/>
회원 이메일 : ${list.bo_me_email }" <br/>
게시판 아이디 : ${list.bo_bbsid}" <br/>
회원 닉네임 : ${list.bo_me_nick }" <br/>
제목 : ${list.bo_title }" <br/>
본문 : ${list.bo_content }" <br/>
조회수 : ${list.bo_hit }" <br/>
게시일자: ${list.bo_regdate }"<br/>
아이피 : ${list.bo_regip }" <br/>


<input type="button" value="수정하기" onclick="location='/board/modifyProc?bo_idx=${list.bo_idx }&bo_bbsid=${list.bo_bbsid}'"/>


<%@ include file="/WEB-INF/views/include/footer.jsp"%>
