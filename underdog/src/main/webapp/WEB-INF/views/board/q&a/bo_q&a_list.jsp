<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

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
						<td><a href="/board/board_cont?bo_bbsid=${list.bo_bbsid}&bo_idx=${list.bo_idx }${pageMaker.makeQuery(pageMaker.cri.page) }&state=read">
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
<c:if test="${sessionScope.MEMBER != null }">
	<button type="button" class="btn btn-default"
		onclick="location.href='/board/registerForm?bo_bbsid=04'">글쓰기</button>
</c:if>




<%@ include file="/WEB-INF/views/include/footer.jsp"%>
