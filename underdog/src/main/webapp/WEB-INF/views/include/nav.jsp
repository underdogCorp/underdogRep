<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="/resources/js/board.js"></script>

<meta charset="UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>pinterest</title>
</head>

<body>
	<nav class="navbar navbar-default">
	<div class="container-fluid">
		<div class="navbar-header">
			<p class="navbar-brand"> 네비게이션 바</p>
		</div>


		<c:if test="${sessionScope.MEMBER ne null }">
			<li><p>${sessionScope.MEMBER.me_name}님이입장하셨습니다.</p></li>
			<li><p>
					<a href="/member/logoutProc">로그아웃</a>
				</p></li>
		</c:if>

		<c:if test="${sessionScope.MEMBER.me_grade eq 100}">
			<li><a href="">관리자모드</a></li>
		</c:if>
		</ul>

	</div>
	</nav>
	<br />
	<br />
	<a>회원등급 : ${sessionScope.MEMBER.me_grade}</a>
	<br>

	<a href="/">홈</a>
	<br>
	<a href="#">회사소개</a>
	<br>
	<a href="/board/list?bo_bbsid=01">공지사항</a>
	<br>
	<a href="/board/list?bo_bbsid=02">자유게시판</a>
	<br>
	<a href="/board/list?bo_bbsid=03">FAQ</a>
	<br>
	<a href="/board/listPage?bo_bbsid=04">Q & A</a>
	<br>

	<c:if test="${sessionScope.MEMBER == null}">
		<a href="/member/loginForm">로그인하기</a>
		<a href="/member/joinForm">회원 가입하기</a>
	</c:if>


	<br />

	======================================================================