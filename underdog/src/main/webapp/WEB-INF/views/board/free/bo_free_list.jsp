<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
</style>




</head>
<body>

	<!DOCTYPE html>
<html>
<head>
<title>Bootstrap Example</title>
<meta charset="UTF-8">
</head>
<body>
	<%@ include file="/WEB-INF/views/include/nav.jsp"%>

	<div class="container">
		<h2>Hover Rows</h2>
		<p>The .table-hover class enables a hover state on table rows:</p>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>제목</th>
					<th>닉네임</th>
					<th>이메일</th>
					<th>날짜</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="list">
					<tr>
						<td><a
							href="/board/board_cont${pageMaker.makeQuery(pageMaker.cri.page) }&bo_bbsid=${list.bo_bbsid}&bo_idx=${list.bo_idx }&state=read">${list.bo_title}</a></td>
						<td>${list.bo_me_nick}</td>
						<td>${list.bo_me_email}</td>
						<td>${list.bo_regdate}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>


		<div class="box-footer">

			<div class="text-center">
				<ul class="pagination">

					<c:if test="${pageMaker.prev}">
						<li><a
							href="/board/list${pageMaker.makeQuery(pageMaker.startPage - 1) }&bo_bbsid=02">&laquo;</a></li>
					</c:if>

					<c:forEach begin="${pageMaker.startPage }"
						end="${pageMaker.endPage }" var="idx">
						<li
							<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
							<a href="/board/list${pageMaker.makeQuery(idx)}&bo_bbsid=02">${idx}</a>
						</li>
					</c:forEach>

					<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						<li><a
							href="/board/list${pageMaker.makeQuery(pageMaker.endPage +1) }&bo_bbsid=02">&raquo;</a></li>
					</c:if>

				</ul>
			</div>
		</div>



		<button type="button" class="btn btn-default"
			onclick="location.href='/board/registerForm?bo_bbsid=02'"
			style="float: right">글쓰기</button>

	</div>





</body>
</html>