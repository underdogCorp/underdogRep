<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/include/nav.jsp"%>


<div class="container" style="padding-bottom: 50px; padding-top: 50px;">
	
	<h2> 공 지 사 항 </h2>
		<table class="table table-striped">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>날짜</th>
					<th>조회수</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>예12</td>
					<td>글제목 입니다</td>
					<td>길라임</td>
					<td>2016.12.02</td>
					<td>2</td>
				</tr>
			</tbody>
		</table>



		<button type="button" class="btn btn-default"
			onclick="location.href='/board/registerForm?bo_bbsid=01'" style="float:right">글쓰기</button>
</div>
































<%@ include file="/WEB-INF/views/include/footer.jsp"%>
