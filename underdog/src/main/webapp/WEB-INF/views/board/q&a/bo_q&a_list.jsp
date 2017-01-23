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
				<!-- 화면 출력 번호  변수 정의 -->		
				<c:set var="num" value="${pageMaker.totalCount-(pageMaker.cri.page-1)*10}"/> 
			
				<c:forEach items="${list}" var="list">
					<tr>
					<td>
					<!-- 번호 출력 부분 -->	
 					<c:out value="${num}"/>			
					<c:set var="num" value="${num-1}"/>	 
					</td>
						<td><a href="/board/board_cont${pageMaker.makeQuery(pageMaker.cri.page) }&bo_bbsid=${list.bo_bbsid}&bo_idx=${list.bo_idx }&state=read">
							<c:out value="${list.bo_title }"/></a></td>
						<td>${list.bo_me_nick }(${list.bo_me_email })</td>
						<td>${list.bo_hit }</td>
						<td>${list.bo_regdate }</td>
						<td>${list.bo_regip }</td>
					</tr>
				</c:forEach>
			</tbody>
				${pageMaker.totalCount }<br/>
				${pageMaker.cri.page }
		</table>
	</div>
	
					<div class="box-footer">

					<div class="text-center">
						<ul class="pagination">

							<c:if test="${pageMaker.prev}">
								<li><a
									href="/board/listPage${pageMaker.makeQuery(pageMaker.startPage - 1) }&bo_bbsid=04">&laquo;</a></li>
							</c:if>

							<c:forEach begin="${pageMaker.startPage }"
								end="${pageMaker.endPage }" var="idx">
								<li
									<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
									<a href="/board/listPage${pageMaker.makeQuery(idx)}&bo_bbsid=04">${idx}</a>
								</li>
							</c:forEach>

							<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
								<li><a
									href="/board/listPage${pageMaker.makeQuery(pageMaker.endPage +1) }&bo_bbsid=04">&raquo;</a></li>
							</c:if>

						</ul>
					</div>
				</div>
				<!-- /.box-footer-->
	
<c:if test="${sessionScope.MEMBER != null }">
	<button type="button" class="btn btn-default"
		onclick="location.href='/board/registerForm?bo_bbsid=04'">글쓰기</button>
</c:if>




<%@ include file="/WEB-INF/views/include/footer.jsp"%>
