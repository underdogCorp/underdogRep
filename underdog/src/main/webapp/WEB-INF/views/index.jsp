<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
Hello Pinterest!!!!! !
</h1>

<c:if test="${sessionScope.MEMBER ne null }">
	<p>${sessionScope.MEMBER.me_name} 님이 입장하셨습니다.</p>
	<p><a href="/member/logoutProc">로그아웃</a></p>
	<br/>
</c:if>

<a href="#">회사소개</a><br>
<a href="/board/bo_info_list">공지사항</a><br>
<a href="/board/bo_free_list">자유게시판</a><br>
<a href="/board/bo_faq_list">FAQ</a><br>
<a href="/board/bo_q&a_list">Q & A</a><br>
<a href="/member/loginForm">로그인하기</a>
<a href="/member/joinForm">회원 가입하기</a>


</body>
</html>
