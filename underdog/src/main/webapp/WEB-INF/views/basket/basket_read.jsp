<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>장바구니</title>

<!-- css 등 head 부분, 나중에 nav에 넣을 것. 일단은 임시로... -->
<style>
/* Set height of the grid so .sidenav can be 100% (adjust if needed) */
.row.content {
	height: 1500px
}

/* Set gray background color and 100% height */
.sidenav {
	background-color: #f1f1f1;
	height: 100%;
}

/* Set black background color, white text and some padding */
footer {
	background-color: #555;
	color: white;
	padding: 15px;
}

/* On small screens, set height to 'auto' for sidenav and grid */
@media screen and (max-width: 767px) {
	.sidenav {
		height: auto;
		padding: 15px;
	}
	.row.content {
		height: auto;
	}
}

h2 {
	margin-left: 50px;
}
</style>
</head>

<!-- css 등 head 부분, 나중에 nav에 넣을 것. 일단은 임시로... -->
<!-- nav 안에서 body 태그 열었음. -->
<%@ include file="/WEB-INF/views/include/nav.jsp"%>

<%-- if(${basket.ba_idx } == null){
	${basket.ba_idx } = 0;
} --%>

=== 임시 출력 확인 ===

<%-- 게시판 번호 : ${basket.ba_idx } <br/>
회원 이메일 : ${basket.ba_me_email } <br/>
게시판 아이디 : ${basket.ba_pr_idx} <br/>
회원 닉네임 : ${basket.ba_termsort } <br/>
제목 : ${basket.ba_termnum } <br/>
본문 : ${basket.ba_price } <br/>
조회수 : ${basket.ba_sum } <br/>
게시일자: ${basket.ba_regdate }<br/> --%>

<c:forEach items="${basket}" var="list">
	<tr>
		<td>${list.ba_idx }</td>
		<td>${list.ba_me_email }</td>
		<td>${list.ba_pr_idx }</td>
		<td>${list.ba_termsort }</td>
		<td>${list.ba_termnum }</td>
		<td>${list.ba_price }</td>
		<td>${list.ba_sum }</td>
		<td>${list.ba_regdate }</td>
	</tr>
</c:forEach>


=== 임시 출력 확인 ===


<%@ include file="/WEB-INF/views/include/footer.jsp"%>