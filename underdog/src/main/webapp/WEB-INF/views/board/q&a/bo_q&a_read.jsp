<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page session="false"%>

<%@ include file="/WEB-INF/views/include/nav.jsp"%>

게시판 번호 : <input type="text" value="${list.bo_idx }"/> <br/>
회원 이메일 : <input type="text" value="${list.bo_me_email }"/> <br/>
게시판 아이디 : <input type="text" value="${list.bbsid}"/> <br/>
회원 닉네임 : <input type="text" value="${list.bo_me_nick }"/> <br/>
제목 : <input type="text" value="${list.bo_title }"/> <br/>
본문 : <input type="text" value="${list.bo_content }"/> <br/>
조회수 : <input type="text" value="${list.bo_hit }"/> <br/>
게시일자: <input type="text" value="${list.bo_regdate }"/> <br/>
아이피 : <input type="text" value="${list.bo_regip }"/> <br/>


<%@ include file="/WEB-INF/views/include/footer.jsp"%>
