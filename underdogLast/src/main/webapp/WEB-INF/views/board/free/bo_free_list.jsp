<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ include file="/WEB-INF/views/include/nav.jsp"%>

<div class="container" style="padding-bottom: 50px; padding-top: 50px;">
		<h2>자유 게시판</h2>
		<table class="table table-hover">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>조회수</th>
					<th>게시일</th>
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
						<td><a href="/board/board_cont${pageMaker.makeQuery(pageMaker.cri.page)}&bo_bbsid=${list.bo_bbsid}&bo_idx=${list.bo_idx }&state=read">${list.bo_title}</a></td>
						<td>${list.bo_me_nick}(${list.bo_me_email})</td>
						<td>${list.bo_hit}</td>
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




</div>

 <%@ include file="/WEB-INF/views/include/footer.jsp"%>