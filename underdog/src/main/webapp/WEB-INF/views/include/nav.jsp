<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>
nav bar 입니다 <br/><br/>

<c:if test="${sessionScope.MEMBER ne null }">
	<p>${sessionScope.MEMBER.me_name} 님이 입장하셨습니다.</p>
	<p><a href="/member/logoutProc">로그아웃</a></p>
	<br/>
</c:if>

<a href="#">회사소개</a><br>
<a href="/board/list?bbsid=01">공지사항</a><br>
<a href="/board/list?bbsid=02">자유게시판</a><br>
<a href="/board/list?bbsid=03">FAQ</a><br>
<a href="/board/list?bbsid=04">Q & A</a><br>
<a href="/member/loginForm">로그인하기</a>
<a href="/member/joinForm">회원 가입하기</a>
