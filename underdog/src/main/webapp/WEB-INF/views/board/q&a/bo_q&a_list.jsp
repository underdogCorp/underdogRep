<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>

<%@ include file="/WEB-INF/views/include/nav.jsp"%>

게시판 번호 : ${list.bo_idx } <br/>
회원 이메일 : ${list.bo_me_email } <br/>
게시판 아이디 : ${list.bbsid} <br/>
회원 닉네임 : ${list.bo_me_nick } <br/>
제목 : <a href="/board/read?bbsid=${list.bbsid}&bno=${list.bo_idx }&page=&lpp=&keyword=&sel=">
		<c:out value="${list.bo_title }"/></a><br/>
조회수 : ${list.bo_hit } <br/>
게시일자: ${list.bo_regdate } <br/>
아이피 : ${list.bo_regip } <br/>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>
