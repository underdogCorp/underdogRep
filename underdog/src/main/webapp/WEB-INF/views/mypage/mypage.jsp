<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/include/nav.jsp"%>


<script>
	function member_view() {

		document.getElementById("memberInfo").style.display = 'block';
		document.getElementById("basketInfo").style.display = 'none';
		document.getElementById("orderInfo").style.display = 'none';
		document.getElementById("myboardInfo").style.display = 'none';
	}

	function basket_view() {
		document.getElementById("basketInfo").style.display = 'block';
		document.getElementById("memberInfo").style.display = 'none';
		document.getElementById("orderInfo").style.display = 'none';
		document.getElementById("myboardInfo").style.display = 'none';
	}
	function order_view() {
		document.getElementById("orderInfo").style.display = 'block';
		document.getElementById("memberInfo").style.display = 'none';
		document.getElementById("myboardInfo").style.display = 'none';
		document.getElementById("basketInfo").style.display = 'none';

	}
	function myboard_view() {
		document.getElementById("myboardInfo").style.display = 'block';
		document.getElementById("memberInfo").style.display = 'none';
		document.getElementById("orderInfo").style.display = 'none';
		document.getElementById("basketInfo").style.display = 'none';

	}
</script>





<div class="container" style="padding-bottom: 50px; padding-top: 110px;">

	<div class="container-fluid">
		<div class="row content">
			<div class="col-sm-2 sidenav">
				<h4>마이 페이지</h4>
				<ul class="nav nav-pills nav-stacked">
					<li><a href="#" data-toggle="modal" data-target="#myModal">회원정보</a></li>
					<li><a onclick="basket_view()">장바구니</a></li>
					<li><a onclick="order_view()">구입목록</a></li>
					<li><a onclick="myboard_view()">내가쓴글</a></li>
				</ul>
				<br>

			</div>

			<div class="col-sm-10">
				<h2>회원정보 보기</h2>
				<form action="/mypage/modifyProc" method="post">
					<input type="hidden" name="me_email" value="${memberInfo.me_email}">
					<div id="memberInfo" style="display: none;">
						<table class="table">
							<thead>
								<tr>
									<th>이름</th>
									<th>닉네임</th>
									<th>생년월일</th>
									<th>회원가입일</th>
									<th>회원등급</th>
									<th>포인트</th>
									<th>주소</th>
									<th>상세주소</th>
								</tr>
							</thead>
							<tbody>

								<tr>
									<td><input type="text" name="me_name"
										value="${memberInfo.me_name}" maxlength="10" size="10" /></td>
									<td><input type="text" name="me_nick"
										value="${memberInfo.me_nick}" maxlength="10" size="10" /></td>
									<td><input type="text" name="me_birth"
										value="${memberInfo.me_birth}" maxlength="10" size="10" /></td>
									<td><fmt:formatDate value="${memberInfo.me_regdate}"
											pattern="Y/M/D" /></td>
									<c:if test="${memberInfo.me_grade eq 100}">
										<td>관리자</td>
									</c:if>
									<c:if test="${memberInfo.me_grade ne 100}">
										<td>일반회원</td>
									</c:if>
									<td>${memberInfo.me_point}</td>
									<td><input type="text" name="me_add1"
										value="${memberInfo.me_add1}" /></td>
									<td><input type="text" name="me_add2"
										value="${memberInfo.me_add2}" /></td>
								</tr>
							</tbody>
						</table>
						<span style="float: right">
							<button type="submit" class="btn btn-warning right">수정하기</button>

						</span> <br>
					</div>
				</form>
				<hr>
				<br>

				<h2>장바구니 내역 보기</h2>

				<div id="basketInfo" style="display: none;">
					<table class="table">
						<thead>
							<tr>
								<th>상품 정보</th>
								<th>고용 형태</th>
								<th>고용 기간</th>
								<th>상품 가격</th>
								<th>상품 담은 날자</th>
							</tr>
						</thead>
						<tbody>

							<tr>
								<td>회사와 함께 성장하겠습니다</td>
								<td>연봉</td>
								<td>3년</td>
								<td>3800만원</td>
								<td>2017/2/7</td>
							</tr>

						</tbody>
					</table>



					<h4>합계금액 : (불러온 가격 입력)</h4>
					<span style="float: right">
						<button type="submit" class="btn btn-danger">주문하기</button>
						<button type="submit" class="btn btn-default right">주문취소</button>
					</span> <br>
				</div>
				<hr>
				<br>

				<h2>구입 목록 보기</h2>

				<div id="orderInfo" style="display: none;">
					<table class="table">
						<thead>
							<tr>
								<th>상품 정보</th>
								<th>상품 가격</th>
								<th>상품 기간</th>
								<th>결제 날자</th>
								<th>연락처</th>
							</tr>
						</thead>
						<tbody>

							<tr>
								<td>오 현 택</td>
								<td>3500만원</td>
								<td>3년</td>
								<td>2017/3/2</td>
								<td>01033314479</td>
							</tr>

						</tbody>
					</table>
					<br>
				</div>
				<hr>
				<br>

				<h2>내가 쓴글 보기</h2>
				<div id="myboardInfo" style="display: block;">
					<table class="table table-hover">
						<thead>
							<tr>
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>조회수</th>
								<th>게시일</th>
								<th>게시판종류</th>
							</tr>
						</thead>
						<tbody>
							<tr>
							<!-- 화면 출력 번호  변수 정의 -->
							<c:set var="num"
								value="${pageMaker.totalCount-(pageMaker.cri.page-1)*10}" />
								<c:forEach items="${myboardList}" var="list">
									<td> <c:out value="${num}" /> <c:set var="num"
											value="${num-1}" /></td>
									<td>${list.bo_title}</td>
									<td>${list.bo_me_nick}(${list.bo_me_email})</td>
									<td>${list.bo_hit}</td>
									<td>${list.bo_regdate}</td>
									<td>${list.bo_bbsid}</td>
							</tr>
							</c:forEach>
						</tbody>
					</table>

					<div class="box-footer">

						<div class="text-center">
							<ul class="pagination">

								<c:if test="${pageMaker.prev}">
									<li><a
										href="/mypage/mypage${pageMaker.makeQuery(pageMaker.startPage - 1) }">&laquo;</a></li>
								</c:if>

								<c:forEach begin="${pageMaker.startPage }"
									end="${pageMaker.endPage }" var="idx">
									<li
										<c:out value="${pageMaker.cri.page == idx?'class =active':''}"/>>
										<a href="/mypage/mypage${pageMaker.makeQuery(idx)}">${idx}</a>
									</li>
								</c:forEach>

								<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
									<li><a
										href="/mypage/mypage${pageMaker.makeQuery(pageMaker.endPage +1) }">&raquo;</a></li>
								</c:if>

							</ul>
						</div>
					</div>
				</div>
				<hr>
				<br>
			</div>
		</div>
	</div>




	<form method="post" action="/mypage/pwcheck">
		<div class="modal fade" id="myModal" role="dialog">
			<div class="modal-dialog modal-sm">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">회원정보를 확인합니다</h4>
					</div>
					<div class="modal-body">
						<p>비밀번호를 입력하세요</p>
						<input type="password" class="form-control" id="me_pw"
							name="me_pw">
					</div>
					<div class="modal-footer">
						<input type="submit" class="btn btn-success" value="확인">
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
						<%-- <input type="hidden" name=me_email
							value="${sessionScope.MEMBER.me_email}" /> --%>
					</div>
				</div>
			</div>
		</div>
	</form>
</div>


<c:if test="${result == 1}">
	<script>
		member_view();
	</script>
	<%
		session.removeAttribute("result");
	%>
</c:if>
<c:if test="${result == -1}">
	<script>
		alert("비밀번호가 다릅니다.");
	</script>
	<%
		session.removeAttribute("result");
	%>
</c:if>




<%@ include file="/WEB-INF/views/include/footer.jsp"%>