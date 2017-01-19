<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page session="false"%>

<%@ include file="/WEB-INF/views/include/nav.jsp"%>


	<div class="container">
		<h2>Q & A</h2>
		<p>무엇이든 물어보세요</p>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>조회수</th>
					<th>게시일</th>
					<th>아이피</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list}" var="list">
					<tr>
						<td>${list.bo_idx }</td>
						<td><a href="/board/read?bo_bbsid=${list.bo_bbsid}&bno=${list.bo_idx }&page=&lpp=&keyword=&sel=">
							<c:out value="${list.bo_title }"/></a></td>
						<td>${list.bo_me_nick }(${list.bo_me_email })</td>
						<td>${list.bo_hit }</td>
						<td>${list.bo_regdate }</td>
						<td>${list.bo_regip }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	<button type="button" class="btn btn-default"
		onclick="location.href='/board/registerForm?bo_bbsid=04'">글쓰기</button>



<%@ include file="/WEB-INF/views/include/footer.jsp"%>
