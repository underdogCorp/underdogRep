<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="/WEB-INF/views/include/mnav.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script>
	function button_delete(me_email) {
		if (confirm("정말 삭제하시겠습니까??") == true) { //확인
			location.href = "/manager/delProc?me_email=" + me_email;
		} else { //취소
			return;
		}
	}
</script>






<div class="container">
	<div class="row">
		<div class="col-sm-12">
			<div class="panel panel-primary">
				<div class="panel-heading">회원 리스트</div>
				<div class="panel-body">


					<h2>모든 회원 정보</h2>
					<table class="table table-hover">
						<thead>
							<tr>
								<th>번호</th>
								<th>이메일</th>
								<th>이름</th>
								<th>닉네임</th>
								<th>생년월일</th>
								<th>회원가입일</th>
								<th>회원등급</th>
								<th>포인트</th>
								<th>우편번호</th>
								<th>주소</th>
								<th>상세주소</th>
								<th>삭제</th>
								<th>수정</th>
							</tr>
						</thead>
						<tbody>
							<!-- 화면 출력 번호  변수 정의 -->
							<c:set var="num"
								value="${pageMaker.totalCount-(pageMaker.cri.page-1)*10}" />

							<c:forEach items="${me_list}" var="me_list">
								<tr>
									<td>
										<!-- 번호 출력 부분 --> <c:out value="${num}" /> <c:set var="num"
											value="${num-1}" />
									</td>
									<td>${me_list.me_email}</td>
									<td>${me_list.me_name}</td>
									<td>${me_list.me_nick}</td>
									<td>${me_list.me_birth}</td>
									<td><fmt:formatDate	value="${me_list.me_regdate}" pattern="Y/M/D" /></td>
									<td>${me_list.me_grade}</td>
									<td>${me_list.me_point}</td>
									<td>${me_list.me_zipcode}</td>
									<td>${me_list.me_add1}</td>
									<td>${me_list.me_add2}</td>
									<td><button type="button" class="btn btn-danger btn-sm"
											onclick="button_delete('${me_list.me_email}')">삭제</button></td>
									<td><button type="button" class="btn btn-warning btn-sm"
											onclick="button_modify('${me_list.me_email}')">수정</button></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>

					<div class="box-footer">

						<div class="text-center">
							<ul class="pagination">

								<c:if test="${pageMaker.prev}">
									<li><a
										href="/manager/memberGet${pageMaker.makeQuery(pageMaker.startPage - 1) }">&laquo;</a></li>
								</c:if>

								<c:forEach begin="${pageMaker.startPage }"
									end="${pageMaker.endPage }" var="idx">
									<li
										<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
										<a href="/manager/memberGet${pageMaker.makeQuery(idx)}">${idx}</a>
									</li>
								</c:forEach>

								<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
									<li><a
										href="/manager/memberGet${pageMaker.makeQuery(pageMaker.endPage +1) }">&raquo;</a></li>
								</c:if>

							</ul>
						</div>
					</div>






				</div>
				<div class="panel-footer">Buy 50 mobiles and get a gift card</div>
			</div>



		</div>
	</div>
	<br>