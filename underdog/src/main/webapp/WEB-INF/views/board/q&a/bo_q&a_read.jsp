<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/include/nav.jsp"%>

<br/>
게시판 번호 : ${data.bo_idx } <br/>
회원 이메일 : ${data.bo_me_email } <br/>
게시판 아이디 : ${data.bo_bbsid} <br/>
회원 닉네임 : ${data.bo_me_nick } <br/>
제목 : ${data.bo_title } <br/>
본문 : ${data.bo_content } <br/>
조회수 : ${data.bo_hit } <br/>
게시일자: ${data.bo_regdate }<br/>
아이피 : ${data.bo_regip } <br/>

<c:if test="${sessionScope.MEMBER.me_email == data.bo_me_email}">
<input type="button" value="수정폼으로" onclick="location='/board/board_cont?bo_idx=${data.bo_idx }&bo_bbsid=${data.bo_bbsid}&state=modify'"/>
<input type="button" value="삭제하기" onclick="location='/board/board_cont?bo_idx=${data.bo_idx }&bo_bbsid=${data.bo_bbsid}&state=modify'"/>
</c:if>

<%@ include file="/WEB-INF/views/include/footer.jsp"%>
